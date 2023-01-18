using StudentApp.Commands;
using StudentApp.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace StudentApp.ViewModel
{
    class MainWindowViewModel : BaseViewModel
    {
        private ICommand seeCommand;
        public ICommand SeeCommand
        {
            get
            {
                seeCommand = new RelayCommands(SeeMethod);

                return seeCommand;
            }
        }
        private void SeeMethod(object param)
        {
            DisplayStudents seeView = new DisplayStudents();
            App.Current.MainWindow.Close();
            App.Current.MainWindow = seeView;
            seeView.Show();

        }
    }
}
