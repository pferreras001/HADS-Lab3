using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;

namespace Mailing
{
    public class Mailing
    {
        public static String mailing(String to, String subject, String body)
        {
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.ehu.eus");

                mail.From = new MailAddress("pferreras001@ehu.ikasle.eus");
                mail.To.Add(to);
                mail.Subject = subject;
                mail.Body = body;

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("663625", "Polmaxf200");
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
                return "mail Send";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }
    }
}
