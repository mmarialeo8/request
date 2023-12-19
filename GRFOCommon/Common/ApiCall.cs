using Newtonsoft.Json;
using System.Text;

namespace GRFOCommon.Common
{
    public class ApiCall
    {
        public static string GetAsync(string baseURL, string routeURL, object _data)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(baseURL);
                var responseTask = client.GetAsync(routeURL);
                responseTask.Wait();

                var result = responseTask.Result;

                if (responseTask.Result.IsSuccessStatusCode)
                {
                    var jsonResponse = responseTask.Result.Content.ReadAsStringAsync();
                    jsonResponse.Wait();
                    return jsonResponse.Result;
                }
                else
                {
                    if (responseTask.Result.StatusCode == System.Net.HttpStatusCode.NotFound)
                        return "{'isTransactionDone':false, 'transactionMessage':'404 Method Not Found', 'statusCode':'" + responseTask.Result.StatusCode + "'}";
                    if (responseTask.Result.StatusCode == System.Net.HttpStatusCode.Unauthorized)
                        return "{'isTransactionDone':false, 'transactionMessage':'401 Unauthorized', 'statusCode':'" + responseTask.Result.StatusCode + "'}";
                    else
                        return "{'isTransactionDone':false, 'transactionMessage':'Method error', 'statusCode':'" + responseTask.Result.StatusCode + "'}";
                }
            }
        }

        public static async Task<string> PostAsync(string baseURL, string routeURL, object _data)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(baseURL);
                var objAsJson = JsonConvert.SerializeObject(_data);
                var content = new StringContent(objAsJson, Encoding.UTF8, "application/json");

                //HTTP POST
                var postTask = client.PostAsync(routeURL, content);
                postTask.Wait();

                if (postTask.Result.IsSuccessStatusCode)
                {
                    var jsonResponse = postTask.Result.Content.ReadAsStringAsync().Result;
                    return jsonResponse;
                }
                else
                {
                    if (postTask.Result.StatusCode == System.Net.HttpStatusCode.NotFound)
                        return "{'IsTransactionDone':false, 'transactionMessage':'404 Method Not Found', 'StatusCode':'" + postTask.Result.StatusCode + "'}";
                    if (postTask.Result.StatusCode == System.Net.HttpStatusCode.Unauthorized)
                        return "{'IsTransactionDone':false, 'transactionMessage':'401 Unauthorized', 'StatusCode':'" + postTask.Result.StatusCode + "'}";
                    else
                        return "{'IsTransactionDone':false, 'transactionMessage':'Method error', 'StatusCode':'" + postTask.Result.StatusCode + "'}";
                }
            }
        }

    }
}
