using ChemicalEquations.Database;
using ChemicalEquations.Types;
using System.Collections.ObjectModel;
using System.Diagnostics;

namespace FormsGUI
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }


        private static ReadOnlyCollection<string> ConvertParticleSymbolFormat(string input)
        {
            List<string> result = [];

            for (int i = 1; i < input.Length; i++)
            {
                result.Add("(" + input.Insert(i, ")(") + ")");
            }

            return result.AsReadOnly();
        }


        private void MainForm_Load(object sender, EventArgs e)
        {
            DatabaseController.Connect("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=C:\\USERS\\LORD_LAMINAT\\DOCUMENTS\\GITHUB\\CHEMICALEQUATIONSCALCULATOR\\CHEMICALEQUATIONS\\DATABASE\\DATABASE1.MDF;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False");
        }

        private void SolveButton_Click(object sender, EventArgs e)
        {
            equationProcessingContainer.ResetText();

            HashSet<Particle> reactives = [];
            string[] input = equationInputTextBox.Text.Trim().Split("+");
            if (input.Length == 1) input = input[0].Split();

            if (input.Length < 2)
            {
                equationOutputTextBox.Text = "Для обработки реакции следует указать более двух взаимодеюствующих веществ";
                return;
            }

            Debug.WriteLine($"Input: {string.Join(' ', input)}");

            foreach (string reactive in input)
            {
                bool flag = false;
                foreach (var word in ConvertParticleSymbolFormat(reactive.Trim()))
                {
                    try
                    {
                        reactives.Add(DatabaseController.GetParticleModel(word).ToParticle());
                        flag = true;
                    }
                    catch (ApplicationException) { }

                    if (flag) break;
                }
                if (!flag)
                {
                    equationOutputTextBox.Text = $"Не удалось распознать вещество: {reactive}";
                    return;
                }
            }

            try
            {
                ChemReaction reactionData = new(reactives);
                equationOutputTextBox.Text = reactionData.ToString();
            }
            catch (ApplicationException ex)
            {
                Debug.WriteLine(ex);
                equationOutputTextBox.Text = ex.ToString();
            }
        }
    }
}
