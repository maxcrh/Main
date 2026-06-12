public class ParkLocator {
	public static List<String> country(String x) {
        ParkService.ParksImplPort country = 
            new ParkService.ParksImplPort();
        return country.byCountry(x);
    }
}