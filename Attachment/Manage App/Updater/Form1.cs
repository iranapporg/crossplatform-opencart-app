using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Collections.Specialized;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Online_Update_App
{
    public partial class Form1 : Form
    {

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            txtversion.Text = Lib.ID;
        }

        private void btnnext_Click(object sender, EventArgs e)
        {

            if (rb2.Checked == true)
            {
                Upload2Site();
            }

            else if (rb1.Checked == true)
            {

                string CurrentDirectory = System.IO.Directory.GetCurrentDirectory();
                string source_name = CurrentDirectory + "\\Manage_Shop.apk";

                SaveFileDialog dialog = new SaveFileDialog
                {
                    Title = "ذخيره فايل خروجي پروژه",
                    Filter = "Apk file|*.apk"
                };

                if (File.Exists(source_name) == false)
                {
                    Application.ExitThread();
                    return;
                }

                if (dialog.ShowDialog() == DialogResult.OK)
                {
                    File.Copy(source_name, dialog.FileName, true);
                }

                Application.ExitThread();

            }
        }

        private void Upload2Site()
        {

            timer1.Enabled = true;
            progressBar1.Visible = true;
            backgroundWorker1.RunWorkerAsync();

        }

        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {

            try
            {
                string CurrentDirectory = System.IO.Directory.GetCurrentDirectory();
                string sourcename = CurrentDirectory + "\\Manage_Shop.apk";

                string fa, en;
                fa = HttpUtility.UrlEncode(txtfa.Text);
                en = HttpUtility.UrlEncode(txten.Text);

                System.Net.WebClient Client = new System.Net.WebClient();
                Client.Headers.Add("Content-Type", "binary/octet-stream");
                Client.Headers.Add("username", "");
                Client.Headers.Add("password", "");
                Client.Headers.Add("version", txtversion.Text);
                Client.Headers.Add("log_fa", fa);
                Client.Headers.Add("log_en", en);

                byte[] result = Client.UploadFile("http://kharidaram.com/app_config/new_version_receive.php", "POST", sourcename);
                string s = System.Text.Encoding.UTF8.GetString(result, 0, result.Length);
            }
            catch (Exception ce)
            {
                MessageBox.Show(ce.Message);
 
            }

        }

        private void backgroundWorker1_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            timer1.Enabled = false;
            lblstate.Visible = true;
            progressBar1.Visible = false;
            progressBar1.Value = 1;
            Application.ExitThread();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (progressBar1.Value == 100) progressBar1.Value = 1;

            progressBar1.Value = progressBar1.Value + 1;

        }

        private void rb1_CheckedChanged(object sender, EventArgs e)
        {
            groupBox2.Enabled = false;
        }

        private void rb2_CheckedChanged(object sender, EventArgs e)
        {
            groupBox2.Enabled = true;
        }

        public static bool CheckForInternetConnection()
        {
            try
            {
                using (var client = new WebClient())
                {
                    using (var stream = client.OpenRead("http://www.google.com"))
                    {
                        return true;
                    }
                }
            }
            catch
            {
                return false;
            }
        }
    }
}
