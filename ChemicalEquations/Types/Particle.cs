using ChemicalEquations.Database;
using System.Numerics;

namespace ChemicalEquations.Types
{
    public class Particle
    {
        private string SelfSymbol { get; }
        public string Symbol => GetSymbolByIons(CationCount, AnionCount, cation: CationData, anion: AnionData, SelfSymbol);
        public bool IsSoluble { get; }
        public short SelfCharge { get; }
        public short Charge => (short)(SelfCharge + (CationData?.Charge ?? 0) * CationCount + (AnionData?.Charge ?? 0) * AnionCount);
        public Particle? CationData { get; }
        public byte CationCount { get; }
        public Particle? AnionData { get; }
        public byte AnionCount { get; }


        public Particle(string selfSymbol, bool isSoluble, int? cationId = null, int? anionId = null, short charge = 0)
        {
            SelfSymbol = selfSymbol;
            IsSoluble = isSoluble;
            SelfCharge = charge;

            
            if (cationId is null && anionId is null)
            {
                CationData = null;
                CationCount = 0;

                AnionData = null;
                AnionCount = 0;
                // All right, this particle has not any components
            }
            else if (cationId is null || anionId is null)
            {
                // Only one of the componnets is null - that's incorrect
                throw new ArgumentException($"Incorrect Particle initialization: symbol={Symbol}, cation_id={cationId}, anion_id={anionId}");
            }
            else
            {
                CationData = DatabaseController.GetParticleModel((int)cationId).ToParticle();
                AnionData = DatabaseController.GetParticleModel((int)anionId).ToParticle();

                int LCM = CationData.SelfCharge * Math.Abs(AnionData.SelfCharge) / (int)BigInteger.GreatestCommonDivisor(CationData.SelfCharge, Math.Abs(AnionData.SelfCharge));

                CationCount = (byte)(LCM / CationData.SelfCharge);
                AnionCount = (byte)(LCM / Math.Abs(AnionData.SelfCharge));
            }
        }


        public Particle[] Dissociate()
        {
            if (!IsSoluble) return [this];

            if (CationCount == 1 && AnionCount == 1 && CationData is not null && AnionData is not null)
            {
                return [CationData, AnionData];
            }
            else if (CationData is not null && AnionData is not null)
            {
                Particle[] result = new Particle[3];

                result[0] = CationData;
                result[1] = AnionData;
                result[2] = DatabaseController.GetParticleModel(GetSymbolByIons(CationCount - 1, AnionCount - 1, CationData, AnionData)).ToParticle();

                return result;
            }
            else if (CationData is not null || AnionData is not null)
            {
#pragma warning disable CS8601 // Возможно, назначение-ссылка, допускающее значение NULL.
                return [CationData ?? AnionData];
#pragma warning restore CS8601
            }
            else throw new ApplicationException($"Can't dissociate particle: {this}");
        }


        public static string GetSymbolByIons(int cationCount, int anionCount, Particle? cation = null, Particle? anion = null, string? selfSymbol = null)
        {
            if (cation is not null && anion is not null && cation.Charge <= 0 && anion.Charge >= 0)
                (cation, anion) = (anion, cation);

            if (cation is null && anion is null)
            {
                // This particle is a simple ion
                if (selfSymbol is not null)
                    return selfSymbol;
                else
                    throw new ApplicationException("Incorrect method usage with some simple ion");
            }
            

            string result = "";

            if (cationCount == 0) cation = null;
            if (anionCount == 0) anion = null;

            var LCM = anionCount * cationCount / BigInteger.GreatestCommonDivisor(anionCount, cationCount);

            if (cation is not null) result += $"{cation.Symbol}{(LCM / cationCount == 1 ? "" : LCM / cationCount)}";
            if (anion is not null) result += $"{anion.Symbol}{(LCM / anionCount == 1 ? "" : LCM / anionCount)}";

            return result;
        }


        public override string ToString() => Symbol;

        public override bool Equals(object? obj) => obj is Particle particle && GetHashCode() == particle.GetHashCode();

        public override int GetHashCode() => HashCode.Combine(Symbol.Trim());

        //public static bool operator ==(Particle? left, Particle? right) => EqualityComparer<Particle>.Default.Equals(left, right);

        //public static bool operator !=(Particle? left, Particle? right) => !(left == right);
    }
}
