using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace GRFOCommon.Models
{
    public class DashboardModels
    {
        public string BUNameId { get; set; }
        public string BUName { get; set; }
        public string COUNT { get; set; }

    }

    public class DashboardResult : TransactionWrapper
    {
        public List<DashboardModels> dashboard { get; set; }
    }
}
