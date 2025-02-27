namespace FTSI_Web_API_System_Integration.Interfaces
{
    public interface IUnitOfWork
    {
        IItemRepository Item { get; }
        ICapitalizationRepository Capitalization { get; }

        IJournalEntryRepository JournalEntry { get; }

        IBusinessPartnerRepository BusinessPartner { get; }

        Task<int> Save();
    }
}