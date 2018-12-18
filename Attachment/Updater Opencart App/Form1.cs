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

        string[] emails, build_configuration;
        int success = 0,fail = 0;
        bool isUpload3Site = false;
        bool force_update = false;
        string currentChoose;

        public Form1()
        {
            InitializeComponent();
            Left = (Screen.PrimaryScreen.Bounds.Width - Width) / 3;
            Top = (Screen.PrimaryScreen.Bounds.Height - Height) / 2;
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            string[] sites = File.ReadAllLines(Application.StartupPath + "/site.txt");
            emails = new string[sites.Length];
            build_configuration = new string[sites.Length];

            int i = 0;

            foreach (string s in sites)
            {
                string[] data = s.Split(new string[] { "<!>" }, StringSplitOptions.None);
                emails[i] = data[1];
                build_configuration[i++] = data[2];
                ls1.Items.Add(data[0]);
            }

            ls1.SelectedIndex = 0;

            int second = (build_configuration.Length * 43) / 59;
            rballupload.Text = rballupload.Text + " [ " + second + " Minute elapsed ]";

        }

        private void btnnext_Click(object sender, EventArgs e)
        {

            if (rb2.Checked == true)
            {
                if (txtlog.Text.Length < 10)
                {
                    MessageBox.Show("Please enter changelog.atleast 10 character", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                if (ls1.SelectedIndex == -1)
                {
                    MessageBox.Show("Please choose server to upload file", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                currentChoose = ls1.Text;

                Upload2Site();
            }

            else if (rb1.Checked == true)
            {

                string CurrentDirectory = System.IO.Directory.GetCurrentDirectory();
                string source_name = CurrentDirectory + "\\opencart.apk";

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
            else if (rballupload.Checked == true)
            {
                timer1.Enabled = true;
                progressBar1.Visible = true;
                currentChoose = ls1.Text;
                backgroundWorker2.RunWorkerAsync();
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
            UploadFile();
        }

        void UploadFile()
        {
            try
            {
                string CurrentDirectory = System.IO.Directory.GetCurrentDirectory();
                string sourcename = CurrentDirectory + "\\opencart.apk";

                string log;
                log = HttpUtility.UrlEncode(txtlog.Text);

                System.Net.WebClient Client = new System.Net.WebClient();
                Client.Headers.Add("Content-Type", "binary/octet-stream");
                Client.Headers.Add("username", "manager_username_admin");
                Client.Headers.Add("version", txtversion.Text);
                Client.Headers.Add("password", "@42eawdAD@@QEAWDASDASDD@@@@@E2@@@@@");

                if (force_update == true)
                    Client.Headers.Add("forceupdate","1");

                Client.Headers.Add("log", log);

                byte[] result = Client.UploadFile(currentChoose + "app/updater/new_version_receive.php", "POST", sourcename);
                string s = System.Text.Encoding.UTF8.GetString(result, 0, result.Length);

                SendMail(emails[ls1.SelectedIndex], txtlog.Text.Replace(System.Environment.NewLine, "<br/>"));

                ++success;

            }
            catch (Exception e1)
            {
                ++fail;
                MessageBox.Show(e1.Message);
            }

        }

        private void backgroundWorker1_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            if (rballupload.Checked == true) return;

            timer1.Enabled = false;
            progressBar1.Visible = false;
            progressBar1.Value = 1;
            MessageBox.Show(String.Format("{0} build configuration compiled and upload to site{1}and {2} compile is fail compile", success, System.Environment.NewLine, fail), "Alert", MessageBoxButtons.OK, MessageBoxIcon.Information);
            Application.ExitThread();

        }

        private void SendMail(string email, string ChangeLog)
        {

            SmtpClient client = new SmtpClient();
            client.Credentials = new NetworkCredential("email.bug.apps@gmail.com", "#@#%@!#QGFAS$!@RQWFVASD");
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;

            try
            {
                MailAddress maFrom = new MailAddress("email.bug.apps@gmail.com", "Opencart Support Center", Encoding.UTF8),
                maTo = new MailAddress(email, "مدیر فروشگاه", Encoding.UTF8);
                MailMessage mmsg = new MailMessage(maFrom.Address, maTo.Address);
                mmsg.Body = "<html><style>* {font-family:tahoma;direction:rtl}</style><body><h4>با سلام</h4><p>آپدیت جدیدی از نسخه اندرویدی فروشگاه شما در سایت بصورت خودکار قرار گرفته است</p><p>تغییرات اپدیت جدید به شرح زیر میباشد :</p><p><b>" + ChangeLog + "</b></p><p><br/><br/>این ایمیل توسط پشتیبانی مرکزی توسعه اپ موبایل ارسال شده است<br/><b>با تشکر پشتیبانی مرکزی اپن کارت</b></p></body></html>";
                mmsg.BodyEncoding = Encoding.UTF8;
                mmsg.IsBodyHtml = true;
                mmsg.Subject = "آپدیت جدید اپ اندرویدی فروشگاه";
                mmsg.SubjectEncoding = Encoding.UTF8;
                client.Send(mmsg);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (progressBar1.Value == 100) progressBar1.Value = 1;

            progressBar1.Value = progressBar1.Value + 1;

        }

        private void rb1_CheckedChanged(object sender, EventArgs e)
        {
            groupBox2.Enabled = false;
            if (rb1.Checked == false)
                ckforce.Enabled = true;
            else
                ckforce.Enabled = false;
        }

        private void rb2_CheckedChanged(object sender, EventArgs e)
        {
            groupBox2.Enabled = true;
            ls1.Enabled = true;
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

        private void rballupload_CheckedChanged(object sender, EventArgs e)
        {
            if (rballupload.Checked == false)
            {
                chkonly_save.Enabled = false;
                isUpload3Site = false;
                return;
            }

            ls1.Enabled = false;            

            FolderBrowserDialog fd = new FolderBrowserDialog();
            if (fd.ShowDialog() == DialogResult.OK)
            {
                if (fd.SelectedPath.Length == 0)
                {
                    MessageBox.Show("Please select path to save output", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    rb1.Checked = true;
                    chkonly_save.Enabled = false;
                    isUpload3Site = false;
                    return;
                }
            }
            else
            {
                rb1.Checked = true;
                chkonly_save.Enabled = false;
                isUpload3Site = false;
                return;
            }

            Lib.output_path = fd.SelectedPath;
            chkonly_save.Enabled = true;

            if (chkonly_save.Checked == true) isUpload3Site = true;

        }

        private void backgroundWorker2_DoWork(object sender, DoWorkEventArgs e)
        {
            for (int i = 0; i < build_configuration.Length; i++)
            {

                Lib.CompilePackage(build_configuration[i], build_configuration[i]);
                backgroundWorker2.ReportProgress(i);
                if (isUpload3Site == true) UploadFile();
            }

        }

        private void backgroundWorker2_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            backgroundWorker1.CancelAsync();
            backgroundWorker2.CancelAsync();
            timer1.Enabled = false;
            progressBar1.Visible = false;
            MessageBox.Show(String.Format("{0} build configuration compiled{1}and {2} compile is fail compile", success, System.Environment.NewLine,fail), "Alert", MessageBoxButtons.OK, MessageBoxIcon.Information);
            Application.ExitThread();
        }

        private void backgroundWorker2_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            ls1.SelectedIndex = e.ProgressPercentage;
            ++success;
            lblsuccess.Text = " ( " + success + " Compiled )";
        }

        private void chkonly_save_CheckedChanged(object sender, EventArgs e)
        {
            ckforce.Enabled = !(chkonly_save.Checked);
        }

        private void ckforce_CheckedChanged(object sender, EventArgs e)
        {
            force_update = ckforce.Checked;
        }


    }
}
