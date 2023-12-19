using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GJCommon.Common
{
    public class apiRoute
    {
        public class request
        {
            public const string get = "/request/get";
            public const string getbyid = "/request/get-id";
            public const string save = "/request/save";
            public const string update = "/request/update";
            public const string delete = "/request/delete/{requestid}";
        }
        public class master
        {
            public const string get = "/master/get-master-data";
            public const string AddEdit = "/master/AddEdit";            
            public const string save = "/master/save-data";            
        }
        public class hadoop
        {
            public const string get = "/master/get-hadoop";
        }

        public class masterdata
        {
            public const string get = "/master/list";            
        }
    }
}
