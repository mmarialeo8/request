using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GRFOCommon.Models
{
    public class GPSTModels
    {
        public int part_request_id { get; set; }
        public string project_type { get; set; }
        public string project_sub_type { get; set; }
        public string grfo_comment_actions_summary { get; set; }
        public string project_requestor { get; set; }
        public string base_part_number { get; set; }
        public string part_description { get; set; }
        public string solution_part_number { get; set; }
        public string bu_name { get; set; }
        public string customer_code { get; set; }
        public string region_code { get; set; }
        public string engineer_comments_notes { get; set; }
        public string process_step { get; set; }
        public string engineering_owner { get; set; }
    }

    public class GPSTResult : TransactionWrapper
    {
        public List<GPSTModels> gpstData { get; set; }
    }
}
