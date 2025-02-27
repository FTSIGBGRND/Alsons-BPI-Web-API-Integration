using FTSI_Web_API_System_Integration.DTOs.ARCreditMemo;
using FTSI_Web_API_System_Integration.Helpers;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo;

namespace FTSI_Web_API_System_Integration.Services
{
    public class APCreditMemoService
    {
        private readonly IAPCreditMemoRepository _repository;

        public APCreditMemoService(IAPCreditMemoRepository repository)
        {
            _repository = repository;
        }

        public async Task<APCreditMemoHeader?> GetStatusAsync(Guid id)
        {
            return await _repository.GetStatusAsync(id);
        }

        public async Task<APCreditMemoHeader> AddAsync(APDebitMemoItemHeaderDTO dto)
        {

            DateTime createdAt = DateTime.Now;
            int lineNum;

            // Get Lines
            List<APCreditMemoLines> lines = new List<APCreditMemoLines>();
            if (dto.DocumentLines != null)
            {

                foreach (APDebitMemoItemLinesDTO line in dto.DocumentLines)
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
                        CreatedAt = createdAt,
                    });
                }
            }

            // Get WTax
            List<APCreditMemoWTax> taxes = new List<APCreditMemoWTax>();
            if (dto.DocumentWTax != null)
            {
                lineNum = 0;
                foreach (APDebitMemoWTaxDTO tax in dto.DocumentWTax)
                {
                    taxes.Add(new APCreditMemoWTax
                    {
                        LineNum = lineNum,
                        WTCode = tax.WTCode,
                        TaxbleAmnt = tax.TaxbleAmnt,
                        WTAmnt = tax.WTAmnt,
                        U_RefNum = tax.U_RefNum,
                        CreatedAt = createdAt,
                    }); ;
                    lineNum++;
                }
            }

            // Get Header
            APCreditMemoHeader header = new()
            {
                CardCode = dto.CardCode,
                CardName = dto.CardName,
                DocDate = dto.DocDate,
                DocDueDate = dto.DocDueDate,
                TaxDate = dto.TaxDate,
                NumAtCard = dto.NumAtCard,
                DocType = dto.DocType,
                JrnlMemo = dto.JrnlMemo,
                Comments = dto.Comments,
                U_RefNum = dto.U_RefNum,
                U_FileName = dto.U_FileName,
                DocumentLines = lines,
                DocumentWTax = taxes,
                CreatedAt = createdAt,
            };

            await _repository.AddAsync(header);
            await _repository.SaveChangesAsync();

            return header;
        }

        public async Task<APCreditMemoHeader> AddAsync(APDebitMemoServiceHeaderDTO dto)
        {

            DateTime createdAt = DateTime.Now;
            int lineNum;

            // Get Lines
            List<APCreditMemoLines> lines = new List<APCreditMemoLines>();
            if (dto.DocumentLines != null)
            {
                foreach (APDebitMemoServiceLinesDTO line in dto.DocumentLines)
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
                        CreatedAt = createdAt,
                    });
                }
            }

            // Get WTax
            List<APCreditMemoWTax> taxes = new List<APCreditMemoWTax>();
            if (dto.DocumentWTax != null)
            {
                lineNum = 0;
                foreach (APDebitMemoWTaxDTO tax in dto.DocumentWTax)
                {
                    taxes.Add(new APCreditMemoWTax
                    {
                        LineNum = lineNum,
                        WTCode = tax.WTCode,
                        TaxbleAmnt = tax.TaxbleAmnt,
                        WTAmnt = tax.WTAmnt,
                        U_RefNum = tax.U_RefNum,
                        CreatedAt = createdAt,
                    });

                    lineNum++;
                }
            }

            // Get Header
            APCreditMemoHeader header = new()
            {
                CardCode = dto.CardCode,
                CardName = dto.CardName,
                DocDate = dto.DocDate,
                DocDueDate = dto.DocDueDate,
                TaxDate = dto.TaxDate,
                NumAtCard = dto.NumAtCard,
                DocType = DocType.Service,
                JrnlMemo = dto.JrnlMemo,
                Comments = dto.Comments,
                U_RefNum = dto.U_RefNum,
                U_FileName = dto.U_FileName,
                DocumentLines = lines,
                DocumentWTax = taxes,
                CreatedAt = createdAt,
            };

            await _repository.AddAsync(header);
            await _repository.SaveChangesAsync();

            return header;
        }

        public async Task<APCreditMemoHeader> CancelAsync(APCreditMemoHeader entity)
        {
            // Update Cancel Field and CancelDate Field
            entity.Canceled = 'Y';
            entity.CancelDate = DateTime.Now;
            entity.IntegrationStatus = 'P';

            _repository.Update(entity);
            await _repository.SaveChangesAsync();

            return entity;
        }
    }
}
