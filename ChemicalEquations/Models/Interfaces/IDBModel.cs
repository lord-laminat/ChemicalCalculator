using ChemicalEquations.Types;

namespace ChemicalEquations.Models.Interfaces
{
    internal interface IDBModel
    {
        int ID { get; }
        public Particle ToParticle();
    }
}
