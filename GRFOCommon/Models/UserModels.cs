using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace GRFOCommon.Models
{
    public class UserModels
    {
        public string username { get; set; }
        public string password { get; set; }
        public int role { get; set; }
        public string? roleText { get; set; }

    }

    public class UserResponse : TransactionWrapper
    {
        public UserModels dashboard { get; set; }
    }


    public class AuthenticationResponse : TransactionWrapper
    {
        public string token { get; set; }
        public UserModels user { get; set; }

    }

}
