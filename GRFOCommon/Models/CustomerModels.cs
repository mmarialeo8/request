using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GRFOCommon.Models
{
    public class customerModels
    {
        public string customerId { get; set; }
        public string customerName { get; set; }
        public string customerType { get; set; }
    }


    public class customerResult : TransactionWrapper
    {
        public List<customerModels> customers { get; set; }
    }

}
