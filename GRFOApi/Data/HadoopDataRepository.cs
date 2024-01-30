﻿using Dapper;
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

                    var query = @"select
		                basePartId	
		                ,basePartNumber	
		                ,partDescription	
		                ,stdCostBasePart	
		                ,annualRepairForecast	
		                ,extendedSpendPotential	
		                ,t1CustomerQty	
		                ,t2CustomerQty	
		                ,mg3
	                from [dbo].[hadoopData]
	                where basePartNumber=@basePartNumber";

                    var res = (await _db.QueryAsync<hadoopDataModels>
                        (sql: query,
                        new
                        {
                            basePartNumber = basePartNumber
                        },
                        commandType: CommandType.Text)).FirstOrDefault();
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
