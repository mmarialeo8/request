using Dapper;
using GJCommon.Common;
using GJCommon.Models;
using GRFOCommon.Models;
using System.Data;
using System.Data.SqlClient;

namespace GJApi.Data
{
    public interface IMasterData
    {
        Task<MasterDataResult> GetMasterDataList(string tableName, string columnIdName, string columnValueName);
    }
    public class MasterDataRepository : IMasterData
    {
        private readonly IConfiguration _iConfiguration;
        private readonly string sConnectionString;
        public MasterDataRepository(IConfiguration _iConfiguration)
        {
            this._iConfiguration = _iConfiguration;
            this.sConnectionString = _iConfiguration.GetSection("ConnectionStrings:sConnectionString").Value;
        }

        public async Task<MasterDataResult> GetMasterDataList(string tableName, string columnIdName, string columnValueName)
        {
            var result = new MasterDataResult();
            using (IDbConnection _db = new SqlConnection(sConnectionString))
            {
                try
                {
                    var query = string.Format("select {0} columnId, {1} columnValue from {2}", columnIdName, columnValueName, tableName);

                    var res = (await _db.QueryAsync<MasterDataModels>
                        (sql: query,
                        new
                        {
                          
                        },
                        commandType: CommandType.Text)).AsList();
                    if (res != null)
                    {
                        result.isTransactionDone = true;
                        result.data = res;
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
