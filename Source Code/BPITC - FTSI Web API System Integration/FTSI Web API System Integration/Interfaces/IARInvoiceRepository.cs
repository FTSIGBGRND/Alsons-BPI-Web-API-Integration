using FTSI_Web_API_System_Integration.Models.BusinessObjects.ARInvoice;

namespace FTSI_Web_API_System_Integration.Interfaces
{
    public interface IARInvoiceRepository
    {
        Task AddARInvoiceAsync(ARInvoiceHeader invoiceHeader);
        Task<int> SaveChangesAsync();
        Task<ARInvoiceHeader?> GetStatusAsync(Guid id);
    }
}
