using DocumentFormat.OpenXml.Spreadsheet;
using GRFOCommon.Common;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System.Data;
using System.IO;
using System.Text;

namespace GRFOWeb.Controllers
{
    public class BulkUploadController : Controller
    {
       
        [Route("/bulk-update")]
        public IActionResult Index()
        {
            return View();
        }

        public ActionResult Download()
        {
            string Files = "wwwroot/UploadExcel/Request_Master.xlsx";
            byte[] fileBytes = System.IO.File.ReadAllBytes(Files);
            System.IO.File.WriteAllBytes(Files, fileBytes);
            MemoryStream ms = new MemoryStream(fileBytes);
            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, "Request Master.xlsx");
        }

        [HttpPost("/bulk-update/validate-data")]
        public async Task<ActionResult> ValidateData()
        {
            IFormFile file = Request.Form.Files[0];
            string folderName = "UploadExcel";
            string webRootPath = @"D:\";
            string newPath = Path.Combine(webRootPath, folderName);
            StringBuilder sb = new StringBuilder();
            if (!Directory.Exists(newPath))
            {
                Directory.CreateDirectory(newPath);
            }
            if (file.Length > 0)
            {
                string sFileExtension = Path.GetExtension(file.FileName).ToLower();
                ISheet sheet;
                string fullPath = Path.Combine(newPath, file.FileName);
                using (var stream = new FileStream(fullPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                    stream.Position = 0;
                    if (sFileExtension == ".xls")
                    {
                        HSSFWorkbook hssfwb = new HSSFWorkbook(stream); //This will read the Excel 97-2000 formats  
                        sheet = hssfwb.GetSheetAt(0); //get first sheet from workbook  
                    }
                    else
                    {
                        XSSFWorkbook hssfwb = new XSSFWorkbook(stream); //This will read 2007 Excel format  
                        sheet = hssfwb.GetSheetAt(0); //get first sheet from workbook   
                    }
                    IRow headerRow = sheet.GetRow(0); //Get Header Row
                    int cellCount = headerRow.LastCellNum;

                    try
                    {
                        bool isValid = ValidateExcelFile(headerRow);

                        if (isValid)
                        {
                            sb.Append("<table class='table table-bordered table-hover no-warp' id='dtUploadData'><tr class='bg-primary'>");
                            for (int j = 0; j < cellCount; j++)
                            {
                                NPOI.SS.UserModel.ICell cell = headerRow.GetCell(j);
                                if (cell == null || string.IsNullOrWhiteSpace(cell.ToString())) continue;
                                sb.Append("<th>" + cell.ToString() + "</th>");
                            }
                            sb.Append("</tr>");
                            sb.AppendLine("<tr>");
                            for (int i = (sheet.FirstRowNum + 1); i <= sheet.LastRowNum; i++) //Read Excel File
                            {
                                IRow row = sheet.GetRow(i);
                                if (row == null) continue;
                                if (row.Cells.All(d => d.CellType == NPOI.SS.UserModel.CellType.Blank)) continue;
                                for (int j = row.FirstCellNum; j < cellCount; j++)
                                {
                                    if (row.GetCell(j) != null)
                                    {
                                        string columnName = string.Empty;
                                        string columnNameValue = row.GetCell(j).ToString();

                                        var errorClass = await validateColumnData(columnName, columnNameValue) ? "" : "class=''";

                                        sb.Append("<td " + errorClass + ">" + row.GetCell(j).ToString() + "</td>");
                                    }
                                    else
                                    {
                                        sb.Append("<td></td>");
                                    }
                                }
                                sb.AppendLine("</tr>");
                            }
                            sb.Append("</table>");
                        }
                        else
                        {
                            sb.Append("Invalid Excel File. Column names mismatch");
                        }
                    }
                    catch (Exception ex)
                    {
                        sb.Append("Invalid Excel File\n\n" + ex.ToString());
                    }
                }
            }
            return this.Content(sb.ToString());
        }

        [Route("/bulk-upload/donwload-template")]
        public async Task<IActionResult> Export(string requestSource, string basePartNumber)
        {

            string[] basepartNumbers = basePartNumber.Split(',');

            DataTable dtExcelSource = GetExcelTemplate();

            string Files = "wwwroot/UploadExcel/Request_Master.xlsx";

            string sWebRootFolder = @"wwwroot/UploadExcel/";
            string sFileName = @"Request_Master.xlsx";
            string URL = string.Format("{0}://{1}/{2}", Request.Scheme, Request.Host, sFileName);
            FileInfo file = new FileInfo(Path.Combine(sWebRootFolder, sFileName));
            var memory = new MemoryStream();
            using (var fs = new FileStream(Path.Combine(sWebRootFolder, sFileName), FileMode.Create, FileAccess.Write))
            {
                IWorkbook workbook;
                workbook = new XSSFWorkbook();

                ISheet excelSheet = workbook.CreateSheet("Request Master");
                IRow row = excelSheet.CreateRow(0);

                #region Creating Top Rows

                for (int i = 0; i < dtExcelSource.Columns.Count; i++)
                {
                    row.CreateCell(i).SetCellValue(dtExcelSource.Columns[i].ColumnName);
                }

                #endregion

                for (int i = 0; i < basepartNumbers.Length; i++)
                {
                    row = excelSheet.CreateRow(i + 1);
                    for (int j = 0; j < dtExcelSource.Columns.Count; j++)
                    {
                        if (j == 0)
                        {
                            row.CreateCell(j).SetCellValue(requestSource);
                        }
                        else if (j == 1)
                        {
                            row.CreateCell(j).SetCellValue(basepartNumbers[i]);
                        }
                        else
                        {
                            row.CreateCell(j).SetCellValue(string.Empty);
                        }
                    }
                }


                //row = excelSheet.CreateRow(1);
                //row.CreateCell(0).SetCellValue(1);
                //row.CreateCell(1).SetCellValue("Jack Supreu");
                //row.CreateCell(2).SetCellValue(45);
                //row.CreateCell(3).SetCellValue("Male");
                //row.CreateCell(4).SetCellValue("Solution Architect");

                //row = excelSheet.CreateRow(2);
                //row.CreateCell(0).SetCellValue(2);
                //row.CreateCell(1).SetCellValue("Steve khan");
                //row.CreateCell(2).SetCellValue(33);
                //row.CreateCell(3).SetCellValue("Male");
                //row.CreateCell(4).SetCellValue("Software Engineer");

                //row = excelSheet.CreateRow(3);
                //row.CreateCell(0).SetCellValue(3);
                //row.CreateCell(1).SetCellValue("Romi gill");
                //row.CreateCell(2).SetCellValue(25);
                //row.CreateCell(3).SetCellValue("FeMale");
                //row.CreateCell(4).SetCellValue("Junior Consultant");

                //row = excelSheet.CreateRow(4);
                //row.CreateCell(0).SetCellValue(4);
                //row.CreateCell(1).SetCellValue("Hider Ali");
                //row.CreateCell(2).SetCellValue(34);
                //row.CreateCell(3).SetCellValue("Male");
                //row.CreateCell(4).SetCellValue("Accountant");

                //row = excelSheet.CreateRow(5);
                //row.CreateCell(0).SetCellValue(5);
                //row.CreateCell(1).SetCellValue("Mathew");
                //row.CreateCell(2).SetCellValue(48);
                //row.CreateCell(3).SetCellValue("Male");
                //row.CreateCell(4).SetCellValue("Human Resource");

                workbook.Write(fs);
            }
            using (var stream = new FileStream(Path.Combine(sWebRootFolder, sFileName), FileMode.Open))
            {
                await stream.CopyToAsync(memory);
            }
            memory.Position = 0;
            return File(memory, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", sFileName);
        }

        public DataTable GetExcelTemplate()
        {
            DataTable dt = new DataTable();
            dt.TableName = "";

            dt.Columns.Add("Request Source", typeof(string));
            dt.Columns.Add("Base Part Number", typeof(string));
            dt.Columns.Add("Request Category", typeof(string));
            dt.Columns.Add("Business Type", typeof(string));
            dt.Columns.Add("Requestor Project Group", typeof(string));
            dt.Columns.Add("Requestor", typeof(string));
            dt.Columns.Add("Part Description", typeof(string));
            dt.Columns.Add("Solution Part Number", typeof(string));
            dt.Columns.Add("Need By Date", typeof(string));
            dt.Columns.Add("BU Name", typeof(string));
            dt.Columns.Add("Target Customer", typeof(string));
            dt.Columns.Add("Customer Location", typeof(string));
            dt.Columns.Add("Comments", typeof(string));
            dt.Columns.Add("Exective Name", typeof(string));
            dt.Columns.Add("GRFO Comment", typeof(string));
            dt.Columns.Add("CC Number", typeof(string));
            return dt;
        }

        public bool ValidateExcelFile(IRow headerRow)
        {
            bool isValid = true;

            DataTable dtExcel = GetExcelTemplate();

            int cellCount = headerRow.LastCellNum;

            for (int j = 0; j < cellCount; j++)
            {
                NPOI.SS.UserModel.ICell cell = headerRow.GetCell(j);
                if (cell == null || string.IsNullOrWhiteSpace(cell.ToString()))
                {
                    isValid = false;
                    break;
                }
                else if (dtExcel.Columns[j].ColumnName != cell.ToString())
                {
                    isValid = false;
                    break;
                }
            }

            return isValid;
        }

        public async Task<bool> validateColumnData(string columnNameText, string columnNameValue)
        {

            // _iMasterData.GetMasterIdByName("RepairCategory", "RepairCategoryId", "RepairCategory", item.project_type)

            string tableName = "RepairCategory";
            string columnIdName = "RepairCategoryId";
            string columnName = "RepairCategory";
            string columnValue = columnNameValue;

            var transactionResult = ApiCall.GetAsync(CommonMembers.apiBaseUrl, apiRoute.master.getmasteridbyname + "?tableName=" + tableName + "&columnIdName=" + columnIdName + "&columnName=" + columnName + "&columnValue=" + columnValue, null);
            int id = JsonConvert.DeserializeObject<int>(transactionResult);
            return (id != 0);
        }
   
    }
}
