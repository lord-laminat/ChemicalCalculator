using ChemicalEquations.Database;

namespace ChemicalEquations.Types
{
    internal sealed class Equation(IEnumerable<Particle> leftSide)
    {
        public HashSet<Particle> LeftSide { get; private set; } = leftSide.ToHashSet();
        public HashSet<Particle> RightSide { get; private set; } = GetRightSide(leftSide);
        public bool IsCorrect => LeftSide.ToArray() != RightSide.ToArray();

        private static List<Particle> GetDissociatedLeftSide(IEnumerable<Particle> leftSide)
        {
            List<Particle> dissociatedLeftSide = [];

            foreach (Particle particle in leftSide)
                dissociatedLeftSide = [.. dissociatedLeftSide, .. particle.Dissociate()];

            return dissociatedLeftSide;
        }


        private static HashSet<Particle> GetRightSide(IEnumerable<Particle> leftSide)
        {
            List<Particle> dissociatedLeftSide = GetDissociatedLeftSide(leftSide);
            HashSet<Particle> rightSide = [];

        loopStart:

            foreach (var ion1 in dissociatedLeftSide)
            {
                foreach (var ion2 in dissociatedLeftSide)
                {
                    Particle? salt;
                    try
                    {
                        salt = DatabaseController.GetParticleModel(Particle.GetSymbolByIons(1, 1, ion1, ion2)).ToParticle();
                    }
                    catch
                    {
                        salt = null;
                    }

                    if (salt is not null && !salt.IsSoluble && !rightSide.Contains(salt))
                    {
                        rightSide.Add(salt);

                        dissociatedLeftSide.Remove(ion1);
                        dissociatedLeftSide.Remove(ion2);

                        goto loopStart;
                    }
                }
            }
            

            if (dissociatedLeftSide.Count != 0)
            {
            loopStart2:

                foreach (var ion1 in dissociatedLeftSide)
                {
                    foreach (var ion2 in dissociatedLeftSide)
                    {
                        Particle? salt;
                        try
                        {
                            salt = DatabaseController.GetParticleModel(Particle.GetSymbolByIons(1, 1, ion1, ion2)).ToParticle();
                        }
                        catch
                        {
                            salt = null;
                        }

                        if (salt is not null && !rightSide.Contains(salt))
                        {
                            rightSide.Add(salt);

                            dissociatedLeftSide.Remove(ion1);
                            dissociatedLeftSide.Remove(ion2);

                            goto loopStart2;
                        }
                    }
                }
                return dissociatedLeftSide.Concat(rightSide).ToHashSet();
            }
            else return leftSide.ToHashSet();
        }


        public override string ToString()
        {
            if (IsCorrect)
            {
                if (LeftSide == RightSide)
                    return "Реакция не идёт";
                else
                    return LeftSide.Count > 0 ? $"{String.Join(" + ", LeftSide.ToHashSet())} = {String.Join(" + ", RightSide.ToHashSet())}" : "Ошибка";
            }
            else return "";
        }
    }
}
