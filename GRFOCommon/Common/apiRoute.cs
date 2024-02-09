using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GRFOCommon.Common
{
    public class apiRoute
    {
        public class dashboard
        {
            public const string get = "/dashboard/get";
        }
        public class request
        {
            public const string get = "/request/get";
            public const string getbyid = "/request/get-id";
            public const string save = "/request/save";
            public const string update = "/request/update";
            public const string delete = "/request/delete/{requestid}";
            public const string reportdata = "/request/report-data";

        }


        public class customer
        {
            public const string getcustomerlist = "/request/get-customer-list";

        }


        public class master
        {
            public const string get = "/master/get-master-data";
            public const string AddEdit = "/master/AddEdit";
            public const string save = "/master/save-data";
        }
        public class apvData
        {
            public const string get = "/master/get-apv-data";
        }

        public class masterdata
        {
            public const string get = "/master/list";
        }
    }
}
