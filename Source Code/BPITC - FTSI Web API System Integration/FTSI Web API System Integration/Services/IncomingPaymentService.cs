using FTSI_Web_API_System_Integration.DTOs.ARCreditMemo;
using FTSI_Web_API_System_Integration.DTOs.IncomingPayment;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARCreditMemo;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.IncomingPayment;

namespace FTSI_Web_API_System_Integration.Services
{
    public class IncomingPaymentService
    {
        private readonly IIncomingPaymentRepository _repository;

        public IncomingPaymentService(IIncomingPaymentRepository repository)
        {
            _repository = repository;
        }

        public async Task<IncomingPaymentHeader?> GetStatusAsync(Guid id)
        {
            return await _repository.GetStatusAsync(id);
        }

        public async Task<IncomingPaymentHeader> AddAsync(IncomingPaymentHeaderDTO dto)
        {
            DateTime createAt = DateTime.Now;

            // Get Invoices
            List<IncomingPaymentInvoices> invoices = new List<IncomingPaymentInvoices>();

            int lineNum = 0;
            foreach (IncomingPaymentInvoicesDTO invoice in dto.PaymentInvoices)
            {
                invoices.Add(new()
                {
                    LineNum = lineNum,
                    InvType = invoice.InvType,
                    SumApplied = invoice.SumApplied,
                    U_RefNum = invoice.U_RefNum,
                    CreatedAt = createAt
                });

                lineNum++;
            }

            // Get Header
            IncomingPaymentHeader header = new()
            {
                CardCode = dto.CardCode,
                CardName = dto.CardName,
                DocDate = dto.DocDate,
                CashAccnt = dto.CashAccnt,
                CashSum = dto.CashSum,
                TrsfrAcct = dto.TrsfrAcct,
                TrsfrDate = dto.TrsfrDate,
                TrsfrRef = dto.TrsfrRef,
                TrsfrSum = dto.TrsfrSum,
                Canceled = dto.Canceled,
                Series = dto.Series,
                U_RefNum = dto.U_RefNum,
                U_FileName = dto.U_FileName,
                PaymentInvoices = invoices,
                CreatedAt = createAt
            };

            await _repository.AddAsync(header);
            await _repository.SaveChangesAsync();

            return header;
        }
    }
}