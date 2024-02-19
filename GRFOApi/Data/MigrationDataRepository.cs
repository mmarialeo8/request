using GRFOCommon.Models;
using System.Data.SqlClient;
using System.Data;
using Dapper;

namespace GRFOApi.Data
{
    public interface IMigrationData
    {
        Task<GPSTResult> GetNonMigratedData(int requestId);
    }

    public class MigrationDataRepository : IMigrationData
    {

        private readonly IConfiguration _iConfiguration;
        private readonly string sConnectionString;
        private readonly string gpstConnectionString;

        public MigrationDataRepository(IConfiguration _iConfiguration)
        {
            this._iConfiguration = _iConfiguration;
            this.sConnectionString = _iConfiguration.GetSection("ConnectionStrings:sConnectionString").Value;
            this.gpstConnectionString = _iConfiguration.GetSection("ConnectionStrings:gpstConnectionString").Value;
        }



        public async Task<GPSTResult> GetNonMigratedData(int requestId)
        {
            var result = new GPSTResult();
            using (IDbConnection _db = new SqlConnection(gpstConnectionString))
            {
                try
                {
                    var query = @"select 
                        part_request_id
                        ,project_type	
                        ,project_sub_type
                        ,grfo_comment_actions_summary
                        ,project_requestor	
                        ,base_part_number	
                        ,part_description	
                        ,solution_part_number	
                        ,bu_name	
                        ,customer_code	
                        ,region_code	
                        ,engineer_comments_notes	
                        ,process_step	
                        ,engineering_owner
                        from
                        [dbo].[factgpstrprdprts] where part_request_id>@requestId";

                    var res = (await _db.QueryAsync<GPSTModels>
                        (sql: query,
                        new
                        {
                            requestId = requestId
                        },
                        commandType: CommandType.Text)).AsList();
                    if (res != null)
                    {
                        result.isTransactionDone = true;
                        result.gpstData = res;
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
