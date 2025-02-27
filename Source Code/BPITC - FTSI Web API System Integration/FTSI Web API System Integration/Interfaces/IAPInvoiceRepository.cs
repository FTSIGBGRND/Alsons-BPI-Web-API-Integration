using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARInvoice;

namespace FTSI_Web_API_System_Integration.Interfaces
{
    public interface IAPInvoiceRepository
    {
        Task AddAsync(APInvoiceHeader invoiceHeader);
        Task<APInvoiceHeader?> GetStatusAsync(Guid id);
        Task<int> SaveChangesAsync();
    }
}