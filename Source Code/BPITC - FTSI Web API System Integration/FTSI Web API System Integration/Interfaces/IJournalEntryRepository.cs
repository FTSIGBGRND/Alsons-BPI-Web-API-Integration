using FTSI_Web_API_System_Integration.Models.BusinessObjects.JournalEntry;

namespace FTSI_Web_API_System_Integration.Interfaces
{
    public interface IJournalEntryRepository
    {
        Task AddAsync(JournalEntry journalEntry);
        Task<JournalEntry?> GetStatusAsync(Guid id);
        Task<int> SaveChangesAsync();
        void Update(JournalEntry entity);
    }
}