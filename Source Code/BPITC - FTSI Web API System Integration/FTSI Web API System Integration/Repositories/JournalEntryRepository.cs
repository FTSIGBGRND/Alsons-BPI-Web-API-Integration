using FTSI_Web_API_System_Integration.Data;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.JournalEntry;

namespace FTSI_Web_API_System_Integration.Repositories
{
    public class JournalEntryRepository : IJournalEntryRepository
    {
        private readonly FTDBWContext _db;
        public JournalEntryRepository(FTDBWContext db) => _db = db;
        public async Task AddAsync(JournalEntry journalEntry)
        {
            await _db.FTOJDT.AddAsync(journalEntry);
        }

        public async Task<JournalEntry?> GetStatusAsync(Guid id)
        {
            return await _db.FTOJDT.FindAsync(id);
        }

        public void Update(JournalEntry entity)
        {
            _db.FTOJDT.Update(entity);
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _db.SaveChangesAsync();
        }
    }
}
