using System.ComponentModel.DataAnnotations;
using System.Text.RegularExpressions;

namespace PizzaBox.Client.Validations
{
    public class NameAttribute : ValidationAttribute
    {
        public override bool IsValid(object o)
        {
            var s = o as string;
            var regex = new Regex("[a-zA-Z]*"); // regular expression -- 0 or more alpha characters
            if (string.IsNullOrWhiteSpace(s))
            {
                return false;
            }

            if(!regex.IsMatch(s))
            {
                return false;
            }
            
            return true;
        }
    }
}