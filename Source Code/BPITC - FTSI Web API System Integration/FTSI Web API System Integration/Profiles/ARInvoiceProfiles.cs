using AutoMapper;
using FTSI_Web_API_System_Integration.DTOs.ARInvoice;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARInvoice;

namespace FTSI_Web_API_System_Integration.Profiles
{
    public class ARInvoiceProfiles : Profile
    {
        public ARInvoiceProfiles()
        {
            CreateMap<ARInvoiceHeader, ARInvoiceServiceHeaderDTO>().ReverseMap();
            CreateMap<ARInvoiceLines, ARInvoiceServiceLinesDTO>().ReverseMap();
            CreateMap<ARInvoiceWTax, ARInvoiceWTaxDTO>().ReverseMap();

        }
    }
}
