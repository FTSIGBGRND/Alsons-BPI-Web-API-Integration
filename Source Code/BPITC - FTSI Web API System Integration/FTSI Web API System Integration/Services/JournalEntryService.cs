using FTSI_Web_API_System_Integration.DTOs.JournalEntry;
using FTSI_Web_API_System_Integration.Interfaces;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.BusinessPartner;
using FTSI_Web_API_System_Integration.Models.BusinessObjects.JournalEntry;

namespace FTSI_Web_API_System_Integration.Services
{
    public class JournalEntryService
    {
        private readonly IUnitOfWork _unitOfWork;

        public JournalEntryService(IUnitOfWork unitOfWork) => _unitOfWork = unitOfWork;

        public async Task<JournalEntry> AddJournalEntryAsync(AddJournalEntryDTO journalDto)
        {
            DateTime createdAt = DateTime.Now;

            // Journal
            JournalEntry? journal = new JournalEntry();
            journal.U_DocNum = journalDto.U_DocNum;
            journal.RefDate = journalDto.RefDate;
            journal.Memo = journalDto.Memo;
            journal.CreatedAt = createdAt;
            journal.U_RefNum = journalDto.U_RefNum;

            if (journalDto.Lines != null)
            {
                int lineNum = 0;
                foreach (AddJournalEntryLinesDTO linesDto in journalDto.Lines)
                {
                    journal.Lines.Add(new JournalEntryLine
                    {
                        LineId = lineNum,
                        ShortName = linesDto.ShortName,
                        Account = linesDto.Account,
                        LineMemo = linesDto.LineMemo,
                        Debit = linesDto.Debit,
                        Credit = linesDto.Credit,
                        FCCurrency = linesDto.FCCurrency,
                        ProfitCode = linesDto.ProfitCode,
                        OcrCode2 = linesDto.OcrCode2,
                        OcrCode3 = linesDto.OcrCode3,
                        OcrCode4 = linesDto.OcrCode4,
                        OcrCode5 = linesDto.OcrCode5,
                        U_InvDate = linesDto.U_InvDate,
                        U_InvNum = linesDto.U_InvNum,
                        U_VatBase = linesDto.U_VatBase,
                        TransType = linesDto.U_TransType,
                        U_xWTCode = linesDto.U_xWTCode,
                        U_xWTVendor = linesDto.U_xWTVendor,
                        U_xSupplierName = linesDto.U_xSupplierName,
                        U_xCardTyp = linesDto.U_xCardTyp,
                        U_Address = linesDto.U_Address,
                        U_TIN = linesDto.U_TIN,
                        U_TIN1 = linesDto.U_TIN1,
                        U_TIN2 = linesDto.U_TIN2,
                        U_TaxAmt = linesDto.U_TaxAmt,
                        U_TaxableAmt = linesDto.U_TaxableAmt,
                        U_SrceDocNo = linesDto.U_SrceDocNo,
                        U_ORNo = linesDto.U_ORNo,
                        U_SOA = linesDto.U_SOA,
                        U_CheckNo = linesDto.U_CheckNo,
                        U_CheckDate = linesDto.U_CheckDate,
                        U_APVNo = linesDto.U_APVNo,
                        U_VSIRefNo = linesDto.U_VSIRefNo,
                        U_Contract = linesDto.U_Contract,
                        CardType = linesDto.CardType,
                        GroupNum = linesDto.GroupNum,
                        WTLiable = linesDto.WTLiable,
                        E_mail = linesDto.E_mail,
                        Phone1 = linesDto.Phone1,
                        CntctPrsn = linesDto.CntctPrsn,
                        CreatedAt = createdAt
                    });

                    lineNum++;
                }
            }

            await _unitOfWork.JournalEntry.AddAsync(journal);

            await _unitOfWork.Save();

            return journal;
        }

        public async Task<JournalEntry?> GetStatusAsync(Guid id)
        {
            return await _unitOfWork.JournalEntry.GetStatusAsync(id);
        }
    }

}
