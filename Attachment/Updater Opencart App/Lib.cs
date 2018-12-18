using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;
using System.IO;
using System.Windows.Forms;

namespace Online_Update_App
{
    class Lib
    {

        public static string output_path;
        private static string compiler_path = @"C:\Program Files (x86)\Anywhere Software\Basic4android6.3";
        private static string project_path = @"Y:\Documents\My Tools\Current Project\Programming\CrossPlatform\Opencart\Android";
        private static string base_path = System.IO.Directory.GetCurrentDirectory().Replace("Objects", "");

        public static void CompilePackage(string Packagename,string appname)
        {

            if (base_path.IndexOf("objects") < 0)
                base_path = project_path;

            string output = output_path + "\\" + appname + ".apk";
            string command = String.Format(" -Obfuscate=true -Optimize=true -Configuration={0} -BaseFolder=\"{1}\" ",Packagename, project_path);

            ProcessStartInfo ProcessInfo;
            Process process;

            ProcessInfo = new ProcessStartInfo(compiler_path + @"\B4ABuilder.exe", command);
            ProcessInfo.CreateNoWindow = true;
            ProcessInfo.UseShellExecute = false;
            ProcessInfo.WorkingDirectory = Application.StartupPath;
            // *** Redirect the output ***
            ProcessInfo.RedirectStandardError = true;
            ProcessInfo.RedirectStandardOutput = true;
            process = Process.Start(ProcessInfo);
            process.WaitForExit();
            process.Close();

            File.Copy(project_path + "\\Objects\\opencart.apk", output,true);

        }

    }
}
