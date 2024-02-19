using Dapper;
using GJCommon.Common;
using GRFOCommon.Models;
using Newtonsoft.Json.Linq;
using System;
using System.Data;
using System.Data.SqlClient;

namespace GJApi.Data
{
    public interface IMasterData
    {
        Task<MasterDataResult> GetMasterDataList(string tableName, string columnIdName, string columnValueName);
        Task<MasterDataResponse> GetMasterById(int id, string tableName, string columnIdName, string columnValueName, string columnCaption);

        Task<int> GetMasterIdByName(string tableName, string columnIdName, string columnName, string columnValue);


        Task<TransactionWrapper> Save(MasterDataPostModels data);
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

        public async Task<MasterDataResponse> GetMasterById(int id, string tableName, string columnIdName, string columnValueName, string columnCaption)
        {
            var result = new MasterDataResponse();
            using (IDbConnection _db = new SqlConnection(sConnectionString))
            {
                try
                {
                    var query = string.Format("select {0} columnId, {1} columnValue from {2} where {0}={3}", columnIdName, columnValueName, tableName, id);

                    var res = (await _db.QueryAsync<MasterDataModels>
                        (sql: query,
                        new
                        {

                        },
                        commandType: CommandType.Text)).FirstOrDefault();
                    if (res != null)
                    {
                        result.isTransactionDone = true;
                        result.data = res;

                        if (result.isTransactionDone)
                        {
                            result.data.columnValueCaption = columnCaption;
                        }
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

        public async Task<TransactionWrapper> Save(MasterDataPostModels data)
        {
            var result = new TransactionWrapper();
            using (IDbConnection _db = new SqlConnection(sConnectionString))
            {
                try
                {
                    var res = (await _db.QueryAsync<string>
                        (sql: StoreProcedure.master.Save,
                        new
                        {
                            Id = data.Id,
                            Value = data.fieldValue,
                            columnName = data.columnId,
                            columnValue = data.columnValue,
                            caption = data.columnCaption,
                            tableName = data.tableName
                        },
                        commandType: CommandType.StoredProcedure)).FirstOrDefault();
                    if (res != null)
                    {
                        result.isTransactionDone = res.Contains("Success");
                        result.transactionMessage = res;
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

        public async Task<int> GetMasterIdByName(string tableName, string columnIdName, string columnName, string columnValue)
        {
            var result = 0;
            using (IDbConnection _db = new SqlConnection(sConnectionString))
            {
                try
                {
                    var query = string.Format("select {0} columnId from {1} where lower({2})=lower('{3}')", columnIdName, tableName, columnName, columnValue);

                    var res = (await _db.QueryAsync<int>
                        (sql: query,
                        new
                        {

                        },
                        commandType: CommandType.Text)).FirstOrDefault();
                    if (res != null)
                    {
                        result = res;
                    }
                }
                catch (Exception ex)
                {
                }
            }
            return result;
        }

    }
}
