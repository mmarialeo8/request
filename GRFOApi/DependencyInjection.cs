using GJApi.Data;
using GRFOApi.Data;
using System.Security.Principal;

namespace GJApi
{
    public class DependencyInjection
    {
        public static void Bind(IServiceCollection services)
        {
            services.AddSingleton<IDashboardData, DashboardDataRepository>();
            services.AddSingleton<IRequest, RequestRepository>();
            services.AddSingleton<IMasterData, MasterDataRepository>();


            #region APV Data
            
            services.AddSingleton<IAPVDataData, APVDataRepository>();

            #endregion


            #region GPST Data

            services.AddSingleton<IMigrationData, MigrationDataRepository>();

            #endregion


            services.AddSingleton<IAccount, AccountRepository>();

        }
    }
}
