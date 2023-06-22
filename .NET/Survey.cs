    public class Survey : BaseSurvey
    {
        public string Description { get; set; }

        public LookUp SurveyStatus { get; set; }

        public LookUp SurveyTypes { get; set; }

        public BaseUser CreatedBy { get; set; }

        public DateTime DateCreated { get; set; }   

        public DateTime DateModified { get; set; } 
    }
