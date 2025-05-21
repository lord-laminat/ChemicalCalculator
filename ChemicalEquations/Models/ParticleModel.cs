using ChemicalEquations.Models.Interfaces;
using ChemicalEquations.Types;

namespace ChemicalEquations.Models
{
    public sealed class ParticleModel(int id, string symbol, short charge, int? cationId, int? anionId, bool isSoluble) : IDBModel
    {
        public int ID { get; } = id;
        public string SelfSymbol { get; } = symbol;
        public short Charge { get; } = charge;
        public int? CationID { get; } = cationId;
        public int? AnionID { get; } = anionId;
        public bool IsSoluble { get; } = isSoluble;
        public Particle ToParticle() => new(SelfSymbol, IsSoluble, CationID, AnionID, Charge);
    }
}
