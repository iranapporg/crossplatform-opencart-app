namespace Online_Update_App
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.ckforce = new System.Windows.Forms.CheckBox();
            this.lblsuccess = new System.Windows.Forms.Label();
            this.chkonly_save = new System.Windows.Forms.CheckBox();
            this.rballupload = new System.Windows.Forms.RadioButton();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtlog = new System.Windows.Forms.TextBox();
            this.ls1 = new System.Windows.Forms.ComboBox();
            this.btnnext = new System.Windows.Forms.Button();
            this.rb2 = new System.Windows.Forms.RadioButton();
            this.rb1 = new System.Windows.Forms.RadioButton();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.backgroundWorker2 = new System.ComponentModel.BackgroundWorker();
            this.label1 = new System.Windows.Forms.Label();
            this.txtversion = new System.Windows.Forms.TextBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.ckforce);
            this.groupBox1.Controls.Add(this.lblsuccess);
            this.groupBox1.Controls.Add(this.chkonly_save);
            this.groupBox1.Controls.Add(this.rballupload);
            this.groupBox1.Controls.Add(this.progressBar1);
            this.groupBox1.Controls.Add(this.groupBox2);
            this.groupBox1.Controls.Add(this.btnnext);
            this.groupBox1.Controls.Add(this.rb2);
            this.groupBox1.Controls.Add(this.rb1);
            this.groupBox1.Location = new System.Drawing.Point(11, 4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(422, 547);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Option save";
            // 
            // ckforce
            // 
            this.ckforce.AutoSize = true;
            this.ckforce.Enabled = false;
            this.ckforce.Location = new System.Drawing.Point(26, 460);
            this.ckforce.Name = "ckforce";
            this.ckforce.Size = new System.Drawing.Size(254, 19);
            this.ckforce.TabIndex = 12;
            this.ckforce.Text = "Force user to install new update on device";
            this.ckforce.UseVisualStyleBackColor = true;
            this.ckforce.CheckedChanged += new System.EventHandler(this.ckforce_CheckedChanged);
            // 
            // lblsuccess
            // 
            this.lblsuccess.AutoSize = true;
            this.lblsuccess.ForeColor = System.Drawing.Color.LimeGreen;
            this.lblsuccess.Location = new System.Drawing.Point(27, 392);
            this.lblsuccess.Name = "lblsuccess";
            this.lblsuccess.Size = new System.Drawing.Size(0, 15);
            this.lblsuccess.TabIndex = 11;
            // 
            // chkonly_save
            // 
            this.chkonly_save.AutoSize = true;
            this.chkonly_save.Enabled = false;
            this.chkonly_save.Location = new System.Drawing.Point(48, 118);
            this.chkonly_save.Name = "chkonly_save";
            this.chkonly_save.Size = new System.Drawing.Size(215, 19);
            this.chkonly_save.TabIndex = 10;
            this.chkonly_save.Text = "Only save file without upload to site";
            this.chkonly_save.UseVisualStyleBackColor = true;
            this.chkonly_save.CheckedChanged += new System.EventHandler(this.chkonly_save_CheckedChanged);
            // 
            // rballupload
            // 
            this.rballupload.AutoSize = true;
            this.rballupload.Location = new System.Drawing.Point(26, 90);
            this.rballupload.Name = "rballupload";
            this.rballupload.Size = new System.Drawing.Size(171, 19);
            this.rballupload.TabIndex = 9;
            this.rballupload.Tag = "Compile all exists package";
            this.rballupload.Text = "Compile all exists package";
            this.rballupload.UseVisualStyleBackColor = true;
            this.rballupload.CheckedChanged += new System.EventHandler(this.rballupload_CheckedChanged);
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(26, 523);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(368, 18);
            this.progressBar1.TabIndex = 1;
            this.progressBar1.Visible = false;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.txtversion);
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.label2);
            this.groupBox2.Controls.Add(this.txtlog);
            this.groupBox2.Controls.Add(this.ls1);
            this.groupBox2.Enabled = false;
            this.groupBox2.Location = new System.Drawing.Point(26, 149);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(368, 283);
            this.groupBox2.TabIndex = 8;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Online Options";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(19, 89);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(148, 15);
            this.label3.TabIndex = 14;
            this.label3.Text = "What is app\'s changelog?";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(19, 30);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(152, 15);
            this.label2.TabIndex = 13;
            this.label2.Text = "Select shop url for upload :";
            // 
            // txtlog
            // 
            this.txtlog.Location = new System.Drawing.Point(19, 109);
            this.txtlog.Multiline = true;
            this.txtlog.Name = "txtlog";
            this.txtlog.Size = new System.Drawing.Size(327, 92);
            this.txtlog.TabIndex = 12;
            // 
            // ls1
            // 
            this.ls1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.ls1.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(178)));
            this.ls1.FormattingEnabled = true;
            this.ls1.Location = new System.Drawing.Point(19, 51);
            this.ls1.Name = "ls1";
            this.ls1.Size = new System.Drawing.Size(327, 21);
            this.ls1.TabIndex = 11;
            // 
            // btnnext
            // 
            this.btnnext.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnnext.FlatAppearance.BorderColor = System.Drawing.Color.White;
            this.btnnext.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.btnnext.Location = new System.Drawing.Point(283, 486);
            this.btnnext.Name = "btnnext";
            this.btnnext.Size = new System.Drawing.Size(111, 30);
            this.btnnext.TabIndex = 1;
            this.btnnext.Text = "Compile And Save";
            this.btnnext.UseVisualStyleBackColor = false;
            this.btnnext.Click += new System.EventHandler(this.btnnext_Click);
            // 
            // rb2
            // 
            this.rb2.AutoSize = true;
            this.rb2.Location = new System.Drawing.Point(26, 61);
            this.rb2.Name = "rb2";
            this.rb2.Size = new System.Drawing.Size(129, 19);
            this.rb2.TabIndex = 3;
            this.rb2.Text = "Save apk file to site";
            this.rb2.UseVisualStyleBackColor = true;
            this.rb2.CheckedChanged += new System.EventHandler(this.rb2_CheckedChanged);
            // 
            // rb1
            // 
            this.rb1.AutoSize = true;
            this.rb1.Checked = true;
            this.rb1.Location = new System.Drawing.Point(26, 33);
            this.rb1.Name = "rb1";
            this.rb1.Size = new System.Drawing.Size(132, 19);
            this.rb1.TabIndex = 2;
            this.rb1.TabStop = true;
            this.rb1.Text = "Save apk file to disk";
            this.rb1.UseVisualStyleBackColor = true;
            this.rb1.CheckedChanged += new System.EventHandler(this.rb1_CheckedChanged);
            // 
            // backgroundWorker1
            // 
            this.backgroundWorker1.WorkerReportsProgress = true;
            this.backgroundWorker1.WorkerSupportsCancellation = true;
            this.backgroundWorker1.DoWork += new System.ComponentModel.DoWorkEventHandler(this.backgroundWorker1_DoWork);
            this.backgroundWorker1.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.backgroundWorker1_RunWorkerCompleted);
            // 
            // timer1
            // 
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // backgroundWorker2
            // 
            this.backgroundWorker2.WorkerReportsProgress = true;
            this.backgroundWorker2.WorkerSupportsCancellation = true;
            this.backgroundWorker2.DoWork += new System.ComponentModel.DoWorkEventHandler(this.backgroundWorker2_DoWork);
            this.backgroundWorker2.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.backgroundWorker2_RunWorkerCompleted);
            this.backgroundWorker2.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(this.backgroundWorker2_ProgressChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(19, 216);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(160, 15);
            this.label1.TabIndex = 15;
            this.label1.Text = "Enter previous version app : ";
            // 
            // txtversion
            // 
            this.txtversion.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtversion.Location = new System.Drawing.Point(19, 243);
            this.txtversion.Name = "txtversion";
            this.txtversion.Size = new System.Drawing.Size(327, 23);
            this.txtversion.TabIndex = 16;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(445, 563);
            this.Controls.Add(this.groupBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.Manual;
            this.Text = "Update or Save Output file";
            this.TopMost = true;
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnnext;
        private System.Windows.Forms.RadioButton rb2;
        private System.Windows.Forms.RadioButton rb1;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtlog;
        private System.Windows.Forms.ComboBox ls1;
        private System.Windows.Forms.ProgressBar progressBar1;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.RadioButton rballupload;
        private System.ComponentModel.BackgroundWorker backgroundWorker2;
        private System.Windows.Forms.CheckBox chkonly_save;
        private System.Windows.Forms.Label lblsuccess;
        private System.Windows.Forms.CheckBox ckforce;
        private System.Windows.Forms.TextBox txtversion;
        private System.Windows.Forms.Label label1;
    }
}

