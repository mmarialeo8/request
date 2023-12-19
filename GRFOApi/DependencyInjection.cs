using GJApi.Data;
using System.Security.Principal;

namespace GJApi
{
    public class DependencyInjection
    {
        public static void Bind(IServiceCollection services)
        {
            services.AddSingleton<IRequest, RequestRepository>();
            services.AddSingleton<IMasterData, MasterDataRepository>();
            services.AddSingleton<IhadoopData, HadoopDataRepository>();
            
        }
    }
}
