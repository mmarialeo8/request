using Dapper;
using GJCommon.Common;
using GRFOCommon.Models;
using System.Data;
using System.Data.SqlClient;

namespace GJApi.Data
{
    public interface IhadoopData
    {
        Task<hadoopDataResponse> GetHadoopDataList(string basePartNumber);
    }
    public class HadoopDataRepository : IhadoopData
    {
        private readonly IConfiguration _iConfiguration;
        private readonly string sConnectionString;
        public HadoopDataRepository(IConfiguration _iConfiguration)
        {
            this._iConfiguration = _iConfiguration;
            this.sConnectionString = _iConfiguration.GetSection("ConnectionStrings:sConnectionString").Value;
        }

        public async Task<hadoopDataResponse> GetHadoopDataList(string basePartNumber)
        {
            var result = new hadoopDataResponse();
            using (IDbConnection _db = new SqlConnection(sConnectionString))
            {
                try
                {
                    var res = (await _db.QueryAsync<hadoopDataModels>
                        (sql: StoreProcedure.hadoop.SelectAll,
                        new
                        {
                            basePartNumber = basePartNumber
                        },
                        commandType: CommandType.StoredProcedure)).FirstOrDefault();
                    if (res != null)
                    {
                        result.isTransactionDone = true;
                        result.hadoop = res;
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
