using System;
using System.Threading;
using System.Runtime.InteropServices;
using System.Windows.Forms;


// Read only constants

enum MonitorState
{
    ON = -1,
    OFF = 2,
    STANDBY = 1
}

namespace WindowsFormApp1
{
    class Program
    {

        static int HWND_BROADCAST = 0xffff;
        //the message is sent to all top-level windows in the system

        int HWND_TOPMOST = -1;
        //the message is sent to one top-level window in the system

        int HWND_TOP = 0;        //
        int HWND_BOTTOM = 1;        //limited use
        int HWND_NOTOPMOST = -2;       //
        const int SC_MONITORPOWER = 0xF170;
        const int WM_SYSCOMMAND = 0x0112;
        //const int HWND_BROADCAST = 0xFFFF;

        //Dll import must be placed directly above the intended import
        [DllImport("user32.dll")]
        static extern int SendMessage(int hWnd, int Msg, int wParam, int lParam);

        public static void SetMonitorState(MonitorState state)
        {
            SendMessage(HWND_BROADCAST, WM_SYSCOMMAND, SC_MONITORPOWER, (int)state);
        }



        static void Main(string[] args)
        {
            int screenWidth = Screen.PrimaryScreen.Bounds.Width;
            int screenHeight = Screen.PrimaryScreen.Bounds.Height;
            bool flag = true;
            //Console.WriteLine("Resolution: " + screenWidth + "x" + screenHeight);
            while (true)
            {   
                flag = true;
                while (Cursor.Position.X > (screenWidth-10) && Cursor.Position.Y > (screenHeight-10) && flag==true) 
                {
                    SetMonitorState(MonitorState.OFF);
                    //Console.WriteLine("Screen off"+ Cursor.Position.X+" "+ Cursor.Position.Y);
                    flag = false;
                    Thread.Sleep(300);

                    //break;
                }
                //Console.WriteLine("Screen on" + Cursor.Position.X + " " + Cursor.Position.Y);
                Thread.Sleep(1500);

                /*
                if (posX> 1270 && posY > 710)
                {
                    SetMonitorState(MonitorState.OFF);
                    goto exitmode;   
                }
                exitmode:
                    {
                    if (Cursor.Position.X < 1270 && Cursor.Position.Y < 710)
                    {
                        SetMonitorState(MonitorState.ON);
                        Thread.Sleep(1500);
                    }
                }*/
            }

        }

    }
}