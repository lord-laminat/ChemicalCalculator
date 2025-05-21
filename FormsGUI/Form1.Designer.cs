namespace FormsGUI
{
    partial class MainForm
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            toolTip1 = new ToolTip(components);
            equationInputTextBox = new TextBox();
            solveButton = new Button();
            tabControl1 = new TabControl();
            equationsTab = new TabPage();
            label2 = new Label();
            label1 = new Label();
            equationProcessingContainer = new Panel();
            equationOutputTextBox = new Label();
            panel2 = new Panel();
            tabPage2 = new TabPage();
            panel1 = new Panel();
            pictureBox1 = new PictureBox();
            tabControl1.SuspendLayout();
            equationsTab.SuspendLayout();
            equationProcessingContainer.SuspendLayout();
            panel2.SuspendLayout();
            tabPage2.SuspendLayout();
            panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            SuspendLayout();
            // 
            // equationInputTextBox
            // 
            equationInputTextBox.Font = new Font("0xProto Nerd Font Propo", 8.999999F, FontStyle.Regular, GraphicsUnit.Point, 0);
            equationInputTextBox.Location = new Point(655, 6);
            equationInputTextBox.Name = "equationInputTextBox";
            equationInputTextBox.PlaceholderText = "NH4CH3COO + KOH";
            equationInputTextBox.Size = new Size(549, 40);
            equationInputTextBox.TabIndex = 1;
            // 
            // solveButton
            // 
            solveButton.Font = new Font("0xProto Nerd Font Propo", 11F, FontStyle.Regular, GraphicsUnit.Point, 0);
            solveButton.Location = new Point(-1, 3);
            solveButton.Name = "solveButton";
            solveButton.Size = new Size(1204, 52);
            solveButton.TabIndex = 3;
            solveButton.Text = "Решение";
            solveButton.UseVisualStyleBackColor = true;
            solveButton.Click += SolveButton_Click;
            // 
            // tabControl1
            // 
            tabControl1.Appearance = TabAppearance.Buttons;
            tabControl1.Controls.Add(equationsTab);
            tabControl1.Controls.Add(tabPage2);
            tabControl1.Font = new Font("Arial", 10F, FontStyle.Regular, GraphicsUnit.Point, 204);
            tabControl1.Location = new Point(3, 0);
            tabControl1.Name = "tabControl1";
            tabControl1.Padding = new Point(12, 3);
            tabControl1.SelectedIndex = 0;
            tabControl1.Size = new Size(1230, 770);
            tabControl1.TabIndex = 0;
            // 
            // equationsTab
            // 
            equationsTab.Controls.Add(label2);
            equationsTab.Controls.Add(equationInputTextBox);
            equationsTab.Controls.Add(label1);
            equationsTab.Controls.Add(equationProcessingContainer);
            equationsTab.Controls.Add(panel2);
            equationsTab.Location = new Point(4, 47);
            equationsTab.Name = "equationsTab";
            equationsTab.Padding = new Padding(3);
            equationsTab.Size = new Size(1222, 719);
            equationsTab.TabIndex = 0;
            equationsTab.Text = "Решение уравнений";
            equationsTab.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Font = new Font("0xProto Nerd Font Propo", 8.999999F, FontStyle.Regular, GraphicsUnit.Point, 0);
            label2.Location = new Point(7, 52);
            label2.Name = "label2";
            label2.Size = new Size(708, 66);
            label2.TabIndex = 7;
            label2.Text = "Формат ввода/вывода в-ва: <Катион><Анион>.\r\nНапример: KOH, HCl, AgNO3\r\n";
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("0xProto Nerd Font Propo", 8.999999F, FontStyle.Regular, GraphicsUnit.Point, 0);
            label1.Location = new Point(8, 6);
            label1.Name = "label1";
            label1.Size = new Size(650, 33);
            label1.TabIndex = 0;
            label1.Text = "Введите вещества, вступающие в реакцию:\r\n";
            // 
            // equationProcessingContainer
            // 
            equationProcessingContainer.BorderStyle = BorderStyle.FixedSingle;
            equationProcessingContainer.Controls.Add(equationOutputTextBox);
            equationProcessingContainer.Font = new Font("0xProto Nerd Font Propo", 8.999999F, FontStyle.Regular, GraphicsUnit.Point, 0);
            equationProcessingContainer.Location = new Point(6, 180);
            equationProcessingContainer.Name = "equationProcessingContainer";
            equationProcessingContainer.Size = new Size(1201, 531);
            equationProcessingContainer.TabIndex = 5;
            // 
            // equationOutputTextBox
            // 
            equationOutputTextBox.AutoSize = true;
            equationOutputTextBox.Location = new Point(3, 12);
            equationOutputTextBox.Name = "equationOutputTextBox";
            equationOutputTextBox.Size = new Size(626, 33);
            equationOutputTextBox.TabIndex = 2;
            equationOutputTextBox.Text = "Введите вещества для решения уравенния";
            // 
            // panel2
            // 
            panel2.BorderStyle = BorderStyle.FixedSingle;
            panel2.Controls.Add(solveButton);
            panel2.Location = new Point(6, 121);
            panel2.Name = "panel2";
            panel2.Size = new Size(1208, 53);
            panel2.TabIndex = 6;
            // 
            // tabPage2
            // 
            tabPage2.Controls.Add(panel1);
            tabPage2.Location = new Point(4, 47);
            tabPage2.Name = "tabPage2";
            tabPage2.Padding = new Padding(3);
            tabPage2.Size = new Size(1222, 719);
            tabPage2.TabIndex = 1;
            tabPage2.Text = "Таблица растворимости";
            tabPage2.UseVisualStyleBackColor = true;
            // 
            // panel1
            // 
            panel1.AutoScroll = true;
            panel1.Controls.Add(pictureBox1);
            panel1.Location = new Point(6, 6);
            panel1.Name = "panel1";
            panel1.Size = new Size(1198, 710);
            panel1.TabIndex = 1;
            // 
            // pictureBox1
            // 
            pictureBox1.Image = (Image)resources.GetObject("pictureBox1.Image");
            pictureBox1.Location = new Point(6, 3);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new Size(1844, 662);
            pictureBox1.TabIndex = 0;
            pictureBox1.TabStop = false;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(15F, 37F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = SystemColors.ControlLightLight;
            ClientSize = new Size(1232, 772);
            Controls.Add(tabControl1);
            FormBorderStyle = FormBorderStyle.Fixed3D;
            MaximizeBox = false;
            Name = "Form1";
            Text = "Химический калькулятор";
            Load += MainForm_Load;
            tabControl1.ResumeLayout(false);
            equationsTab.ResumeLayout(false);
            equationsTab.PerformLayout();
            equationProcessingContainer.ResumeLayout(false);
            equationProcessingContainer.PerformLayout();
            panel2.ResumeLayout(false);
            tabPage2.ResumeLayout(false);
            panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            ResumeLayout(false);
        }

        #endregion
        private ToolTip toolTip1;
        private TabControl tabControl1;
        private TabPage equationsTab;
        private TabPage tabPage2;
        private Label label1;
        private TextBox equationInputTextBox;
        private Label equationOutputTextBox;
        private Panel equationProcessingContainer;
        private Panel panel2;
        private Button solveButton;
        private Label label2;
        private PictureBox pictureBox1;
        private Panel panel1;
    }
}
