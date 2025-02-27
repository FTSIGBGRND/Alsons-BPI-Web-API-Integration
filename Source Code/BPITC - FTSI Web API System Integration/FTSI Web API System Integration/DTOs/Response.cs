namespace FTSI_Web_API_System_Integration.DTOs
{
    public class PostResponse
    {
        /// <summary>
        /// Status of API Request
        /// </summary>
        /// <value>
        /// Success, Error
        /// </value>
        public string Status { get; set; }
        public string Message { get; set; }

        public PostResponseData Data { get; set; }
    }

    public class PostResponseData
    {
        public Guid? Id { get; set; } = Guid.Empty;
        public string? U_RefNum { get; set; } = string.Empty;
    }

    public class GetResponse
    {
        /// <summary>
        /// Status of API Request
        /// </summary>
        /// <value>
        /// Success, Error
        /// </value>
        public string Status { get; set; }
        public string Message { get; set; }

        public GetResponseData Data { get; set; }
    }

    public class GetResponseData
    {
        public string? IntegrationStatus { get; set; } = string.Empty;
        public string? IntegrationMessage { get; set; } = string.Empty;
        public Guid? Id { get; set; } = Guid.Empty;
        public string? U_RefNum { get; set; } = string.Empty;
    }
}
