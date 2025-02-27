using FTSI_Web_API_System_Integration.DTOs.ARInvoice;
using FTSI_Web_API_System_Integration.Helpers;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARInvoice;
using NuGet.Protocol.Core.Types;

namespace FTSI_Web_API_System_Integration.Services
{
    public class ARInvoiceService
    {
        private readonly IARInvoiceRepository _aRInvoiceRepository;

        public ARInvoiceService(IARInvoiceRepository arInvoicerepository)
        {
            _aRInvoiceRepository = arInvoicerepository;
        }

        public async Task<ARInvoiceHeader> GetStatusAsync(Guid id)
        {
            return await _aRInvoiceRepository.GetStatusAsync(id);
        }

        public async Task<ARInvoiceHeader> AddAsync(ARInvoiceServiceHeaderDTO arInvoiceDTO)
        {

            DateTime createdAt = DateTime.Now;
            List<ARInvoiceLines> lines = [];
            ARInvoiceWTax wtax = new();
            List<ARInvoiceDownPayment> downpayments = [];
            ARInvoiceHeader header = new();

            // Get Lines
            foreach (ARInvoiceServiceLinesDTO line in arInvoiceDTO.DocumentLines)
            {
                lines.Add(new()
                {
                    LineNum = line.LineNum,
                    AccountCode = line.AccountCode,
                    U_BaseType = line.U_BaseType,
                    U_BaseRef = line.U_BaseRef,
                    U_BaseLine = line.U_BaseLine,
                    Description = line.Description,
                    DiscPrcnt = line.DiscPrcnt,
                    Quantity = line.Quantity,
                    Price = line.Price,
                    VatGroup = line.VatGroup,
                    PriceAfVAT = line.PriceAfVAT,
                    WTLiable = line.WTLiable,
                    OcrCode = line.OcrCode,
                    OcrCode2 = line.OcrCode2,
                    OcrCode3 = line.OcrCode3,
                    OcrCode4 = line.OcrCode4,
                    OcrCode5 = line.OcrCode5,
                    U_RefNum = line.U_RefNum,
                    U_LngDscrptn = line.U_LongDscrptn,
                    U_Period = line.U_Period,
                    CreatedAt = createdAt
                });
            }

            // Get WTax
            if (arInvoiceDTO.DocumentWTax != null)
            {
                wtax.WTCode = arInvoiceDTO.DocumentWTax?.WTCode;
                wtax.TaxbleAmnt = arInvoiceDTO.DocumentWTax?.TaxbleAmnt;
                wtax.WTAmnt = arInvoiceDTO.DocumentWTax?.WTAmnt;
                wtax.U_RefNum = arInvoiceDTO.DocumentWTax?.U_RefNum;
                wtax.CreatedAt = createdAt;
            };


            if (arInvoiceDTO.DocumentDownPayments != null)
            {
                foreach (ARInvoiceDownpaymentDTO downpayment in arInvoiceDTO.DocumentDownPayments)
                {
                    downpayments.Add(
                        new()
                        {
                            LineNum = downpayment.LineNum,
                            U_RefNum = downpayment.U_RefNum,
                            U_DPRefNum = downpayment.U_DPRefNum,
                            DrawnSum = downpayment.DrawnSum,
                            CreatedAt = createdAt
                        });
                }
            }

            // Get Header
            header.CardCode = arInvoiceDTO.CardCode;
            header.CardName = arInvoiceDTO.CardName;
            header.DocDate = arInvoiceDTO.DocDate;
            header.DocDueDate = arInvoiceDTO.DocDueDate;
            header.DocType = DocType.Service;
            header.TaxDate = arInvoiceDTO.TaxDate;
            header.NumAtCard = arInvoiceDTO.NumAtCard;
            header.JrnlMemo = arInvoiceDTO.JrnlMemo;
            header.Comments = arInvoiceDTO.Comments;
            header.U_RefNum = arInvoiceDTO.U_RefNum;
            header.U_FileName = arInvoiceDTO.U_FileName;
            header.DocumentLines = lines;
            header.DocumentWTax = wtax;
            header.DownpaymentsLines = downpayments;
            header.CreatedAt = createdAt;


            await _aRInvoiceRepository.AddARInvoiceAsync(header);
            await _aRInvoiceRepository.SaveChangesAsync();

            return header;
        }

        public async Task<ARInvoiceHeader> AddAsync(ARInvoiceItemHeaderDTO arInvoiceDTO)
        {

            DateTime createdAt = DateTime.Now;
            List<ARInvoiceLines> lines = [];
            ARInvoiceWTax wtax = new();
            List<ARInvoiceDownPayment> downpayments = [];
            ARInvoiceHeader header = new();

            // Get Lines
            foreach (ARInvoiceItemLinesDTO line in arInvoiceDTO.DocumentLines)
            {
                lines.Add(new()
                {
                    LineNum = line.LineNum,
                    ItemCode = line.ItemCode,
                    AccountCode = line.AccountCode,
                    U_BaseType = line.U_BaseType,
                    U_BaseRef = line.U_BaseRef,
                    U_BaseLine = line.U_BaseLine,
                    Description = line.Description,
                    DiscPrcnt = line.DiscPrcnt,
                    Quantity = line.Quantity,
                    Price = line.Price,
                    VatGroup = line.VatGroup,
                    PriceAfVAT = line.PriceAfVAT,
                    WTLiable = line.WTLiable,
                    OcrCode = line.OcrCode,
                    OcrCode2 = line.OcrCode2,
                    OcrCode3 = line.OcrCode3,
                    OcrCode4 = line.OcrCode4,
                    OcrCode5 = line.OcrCode5,
                    U_RefNum = line.U_RefNum,
                    U_LngDscrptn = line.U_LongDscrptn,
                    U_Period = line.U_Period,
                    CreatedAt = createdAt
                });
            }

            // Get WTax
            if (arInvoiceDTO.DocumentWTax != null)
            {
                wtax.WTCode = arInvoiceDTO.DocumentWTax?.WTCode;
                wtax.TaxbleAmnt = arInvoiceDTO.DocumentWTax?.TaxbleAmnt;
                wtax.WTAmnt = arInvoiceDTO.DocumentWTax?.WTAmnt;
                wtax.U_RefNum = arInvoiceDTO.DocumentWTax?.U_RefNum;
                wtax.CreatedAt = createdAt;
            };


            if (arInvoiceDTO.DocumentDownPayments != null)
            {
                foreach (ARInvoiceDownpaymentDTO downpayment in arInvoiceDTO.DocumentDownPayments)
                {
                    downpayments.Add(
                        new()
                        {
                            LineNum = downpayment.LineNum,
                            U_RefNum = downpayment.U_RefNum,
                            DrawnSum = downpayment.DrawnSum,
                            CreatedAt = createdAt
                        });
                }
            }

            // Get Header
            header.CardCode = arInvoiceDTO.CardCode;
            header.CardName = arInvoiceDTO.CardName;
            header.DocDate = arInvoiceDTO.DocDate;
            header.DocDueDate = arInvoiceDTO.DocDueDate;
            header.TaxDate = arInvoiceDTO.TaxDate;
            header.NumAtCard = arInvoiceDTO.NumAtCard;
            header.JrnlMemo = arInvoiceDTO.JrnlMemo;
            header.Comments = arInvoiceDTO.Comments;
            header.U_RefNum = arInvoiceDTO.U_RefNum;
            header.U_FileName = arInvoiceDTO.U_FileName;
            header.DocumentLines = lines;
            header.DocumentWTax = wtax;
            header.DownpaymentsLines = downpayments;
            header.CreatedAt = createdAt;


            await _aRInvoiceRepository.AddARInvoiceAsync(header);
            await _aRInvoiceRepository.SaveChangesAsync();

            return header;
        }
    }
}
