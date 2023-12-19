using GJCommon.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GRFOCommon.Models
{
    public class MasterDataModels
    {
        public virtual string tableName { get; set; }
        public virtual string columnId { get; set; }
        public virtual string columnIdCaption { get; set; }
        public virtual string columnIdValue { get; set; }
        public virtual string columnValueId { get; set; }
        public virtual string columnValueCaption { get; set; }
        public virtual string columnValue { get; set; }
    }


    public class MasterDataResponse : TransactionWrapper
    {
        public MasterDataModels data { get; set; }
    }

    public class MasterDataResult : TransactionWrapper
    {
        public List<MasterDataModels> data { get; set; }
    }

    public class MasterDataPostModels
    {
        public virtual int Id { get; set; }
        public virtual string tableName { get; set; }
        public virtual string columnId { get; set; }
        public virtual string columnValue { get; set; }
        public virtual string columnCaption { get; set; }
        public virtual string fieldValue { get; set; }
    }
}
