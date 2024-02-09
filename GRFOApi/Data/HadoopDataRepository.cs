using Dapper;
using GJCommon.Common;
using GRFOCommon.Models;
using System.Data;
using System.Data.SqlClient;
using static GRFOCommon.Common.apiRoute;

namespace GJApi.Data
{
    public interface IAPVDataData
    {
        Task<APVDataResponse> GetApvDatList(string basePartNumber);
    }
    public class APVDataRepository : IAPVDataData
    {
        private readonly IConfiguration _iConfiguration;
        private readonly string sConnectionString;
        public APVDataRepository(IConfiguration _iConfiguration)
        {
            this._iConfiguration = _iConfiguration;
            this.sConnectionString = _iConfiguration.GetSection("ConnectionStrings:apvConnectionString").Value;
        }

        public async Task<APVDataResponse> GetApvDatList(string basePartNumber)
        {
            var result = new APVDataResponse();
            using (IDbConnection _db = new SqlConnection(sConnectionString))
            {
                try
                {

                    var query = @"select material as basePartNumber, material_desc as partDescription, mg3, pbg, cost as stdCostBasePart, gfcst as annualRepairForecast, (cost*gfcst) as extendedSpendPotential from [dbo].[Part_Dimention] where material=@basePartNumber;" +
                        "select part, dh_qty, shiptocust from [dbo].[location_part_demand_history] where part=@basePartNumber";

                    var res = (await _db.QueryMultipleAsync
                        (sql: query,
                        new
                        {
                            basePartNumber = basePartNumber
                        },
                        commandType: CommandType.Text));
                    if (res != null)
                    {
                        result.isTransactionDone = true;
                        result.APVData = res.Read<APVDataModels>().FirstOrDefault();
                        result.locationPart = res.Read<locationPartDemandHistoryModels>().AsList();
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
