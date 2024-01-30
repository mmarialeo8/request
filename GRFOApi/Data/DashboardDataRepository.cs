using Dapper;
using GJCommon.Common;
using GRFOCommon.Models;
using System.Data;
using System.Data.SqlClient;

namespace GJApi.Data
{
    public interface IDashboardData
    {
        Task<DashboardResult> GetDashboardData(string dateFrom, string dateTo);
    }
    public class DashboardDataRepository : IDashboardData
    {
        private readonly IConfiguration _iConfiguration;
        private readonly string sConnectionString;
        public DashboardDataRepository(IConfiguration _iConfiguration)
        {
            this._iConfiguration = _iConfiguration;
            this.sConnectionString = _iConfiguration.GetSection("ConnectionStrings:sConnectionString").Value;
        }

        public async Task<DashboardResult> GetDashboardData(string dateFrom, string dateTo)
        {
            var result = new DashboardResult();
            using (IDbConnection _db = new SqlConnection(sConnectionString))
            {
                try
                {
                    
                    var res = (await _db.QueryAsync<DashboardModels>
                        (sql: StoreProcedure.Dashboard.SelectAll,
                        new
                        {
                            //dateFrom = dateFrom,
                            //dateTo = dateTo
                        },
                        commandType: CommandType.Text)).AsList();
                    if (res != null)
                    {
                        result.isTransactionDone = true;
                        result.dashboard = res;
                    }
                    else
                    {
                        result.isTransactionDone = false;
                        result.transactionMessage = "No Records Found";
                    }
                }
                catch (Exception ex)
                {
                    result.isTransactionDone = false;
                    result.transactionMessage = ex.ToString();
                }
            }
            return result;
        }

    }
}
