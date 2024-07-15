public without sharing class WellnessJourneyVO {
    
    public String userId;
    public String fullName;
    public String email;
    public String username;
    
    public WellnessJourneyVO(String userId, String fullName, String email, String username) {
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.username = username;
    }
}