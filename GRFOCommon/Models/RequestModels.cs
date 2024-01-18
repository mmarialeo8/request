using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GRFOCommon.Models
{
    public class RequestModels
    {
        public virtual int requestId { get; set; }
        public virtual string requestorSource { get; set; }
        public virtual string repairCategory { get; set; }
        public virtual string businessType { get; set; }
        public virtual string basePartNumber { get; set; }
        public virtual string partDescription { get; set; }
        public virtual string screeningStatus { get; set; }
        public virtual string businessCaseStatus { get; set; }
        public virtual string pilotReviewStatus { get; set; }
        public virtual string prdImplementation { get; set; }
        public virtual string t1CustomerQty { get; set; }
        public virtual string needByDate { get; set; }
    }
    public class RequestPostModels
    {
        public virtual int requestId { get; set; }
        public virtual int requestCategoryId { get; set; }
        public virtual int businessTypeId { get; set; }
        public virtual int requestSourceId { get; set; }
        public virtual string requestorProjectGroup { get; set; }
        public virtual string requestor { get; set; }
        public virtual string basePartNumber { get; set; }
        public virtual string partDescription { get; set; }
        public virtual string solutionPartNumber { get; set; }
        public virtual string needByDate { get; set; }
        public virtual int buNameId { get; set; }
        public virtual int repairLocationId { get; set; }
        public virtual string targetCustomer { get; set; }
        public virtual int customerLocationId { get; set; }
        public virtual double annualRepairForecast1 { get; set; }
        public virtual double annualRepairForecast2 { get; set; }
        public virtual double stdCostBasePart { get; set; }
        public virtual double annualRepairForecast { get; set; }
        public virtual double extendedSpendPotential { get; set; }
        public virtual double t1CustomerQty { get; set; }
        public virtual double t2CustomerQty { get; set; }
        public virtual double mg3 { get; set; }
        public virtual string comments { get; set; }
        public virtual string? screeningStatus { get; set; }
        public virtual string? businessCaseStatus { get; set; }
        public virtual string? pilotReviewStatus { get; set; }
        public virtual bool prdImplementation { get; set; }
        public virtual string prdDate { get; set; }
        public virtual string? exectiveName { get; set; }
        public virtual string? grfoComment { get; set; }
        public virtual string? ccNumber { get; set; }

    }

    public class RequestUpdateModels
    {
        public virtual int requestId { get; set; }
        public virtual string? screeningStatus { get; set; }
        public virtual string? businessCaseStatus { get; set; }
        public virtual string? pilotReviewStatus { get; set; }
        public virtual bool prdImplementation { get; set; }
        public virtual string prdDate { get; set; }
        //public virtual string? exectiveName { get; set; }
        //public virtual string? grfoComment { get; set; }
    }
    public class RequestResponse : TransactionWrapper
    {
        public RequestPostModels request { get; set; }
    }
    public class RequestResult : TransactionWrapper
    {
        public List<RequestModels> request { get; set; }
    }

    public class hadoopDataModels
    {
        public virtual int basePartId { get; set; }
        public virtual string basePartNumber { get; set; }
        public virtual string partDescription { get; set; }
        public virtual double stdCostBasePart { get; set; }
        public virtual double annualRepairForecast { get; set; }
        public virtual double extendedSpendPotential { get; set; }
        public virtual double t1CustomerQty { get; set; }
        public virtual double t2CustomerQty { get; set; }
        public virtual double mg3 { get; set; }
    }

    public class hadoopDataResponse : TransactionWrapper
    {
        public hadoopDataModels hadoop { get; set; }
    }
    public class hadoopDataResult : TransactionWrapper
    {
        public List<hadoopDataModels> hadoop { get; set; }
    }





    public class requestReportModels
    {
        public string RequestId { get; set; }
        public string RepairCategory { get; set; }
        public string BusinessType { get; set; }
        public string RequestorSource { get; set; }
        public string RequestorProjectGroup { get; set; }
        public string Requestor { get; set; }
        public string BasePartNumber { get; set; }
        public string PartDescription { get; set; }
        public string SolutionPartNumber { get; set; }
        public string NeedByDate { get; set; }
        public string BUNameId { get; set; }
        public string RepairLocation { get; set; }
        public string TargetCustomer { get; set; }
        public string CustomerLocations { get; set; }
        public string AnnualRepairForecast1 { get; set; }
        public string AnnualRepairForecast2 { get; set; }
        public string STDCostBasePart { get; set; }
        public string AnnualRepairForecast { get; set; }
        public string ExtendedSpendPotential { get; set; }
        public string T1CustomerQty { get; set; }
        public string T2CustomerQty { get; set; }
        public string MG3 { get; set; }
        public string Comments { get; set; }
        public string ScreeningStatus { get; set; }
        public string BusinessCaseStatus { get; set; }
        public string PilotReviewStatus { get; set; }
        public string PrdImplementation { get; set; }
        public string PrdDate { get; set; }
        public string ExectiveName { get; set; }
        public string GRFOComment { get; set; }
        public string CCNumber { get; set; }

    }


    public class requestReportResult : TransactionWrapper
    {
        public List<requestReportModels> report { get; set; }
    }

}
