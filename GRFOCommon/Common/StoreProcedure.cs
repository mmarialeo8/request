using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GJCommon.Common
{
    public class StoreProcedure
    {
        public class Request
        {
            public const string SelectAll = "[dbo].[Request_SelectAll]";
            public const string Save = "[dbo].[Request_Save]";
            public const string Update = "[dbo].[Request_Status_Update]";
        }

        public class hadoop
        {
            public const string SelectAll = "[dbo].[hadoop_Data_SelectAll]";
        }
    }
}
