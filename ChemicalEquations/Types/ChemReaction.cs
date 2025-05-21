namespace ChemicalEquations.Types
{
    public sealed class ChemReaction
    {
        internal List<Equation> EquationStream { get; private set; } = [];
        internal bool IsSolved => EquationStream.Count == 0 || EquationStream[^1].RightSide.All((particle) => particle.Charge == 0);


        public ChemReaction(IEnumerable<Particle> reactives)
        {
            MakeSolveStep(reactives);
            while (!IsSolved) MakeSolveStep();
        }

        private void MakeSolveStep()
        {
            Equation equation = new(EquationStream[^1].RightSide);

            if (equation.IsCorrect) EquationStream.Add(equation);
        }


        private bool MakeSolveStep(IEnumerable<Particle> reactives)
        {
            Equation equation = new(reactives);

            if (equation.IsCorrect) EquationStream.Add(equation);

            return true;
        }


        public override string ToString()
        {
            if (EquationStream.Count == 0 || !EquationStream[0].IsCorrect)
            {
                return "Реакция между указанными веществами не идет";
            }
            else
            {
                string res = "";

                foreach (var equation in EquationStream)
                {
                    res += equation.ToString();
                    res += "\n";
                }

                return res;
            }
        }
    }
}
