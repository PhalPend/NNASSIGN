/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* This class contains all the variables to Parse JSON  for Country Layer API.
* Response form the Api will be mapped into corresponding Country_c Object Fields 
* As of now we are not using all the field from the API but mapped all Response Attributes for Future use
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Phalguni Pendyala
* @modifiedBy     
* @maintainedBy   
* @version        1.0
**/

public class CountryLayerAPIWrapper {

	public class Languages {
		public String iso639_1;
		public String iso639_2;
		public String name;
		public String nativeName;
	}

	public class Translations {
		public String br;
		public String de;
		public String es;
		public String fa;
		public String fr;
		public String hr;
		public String it;
		public String ja;
		public String nl;
		public String pt;
	}

	public class RegionalBlocs {
		public String acronym;
		public String name;
	}


	public class Currencies {
		public String code;
		public String name;
		public String symbol;
	}
    public String name;
	public List<String> topLevelDomain;
	public String alpha2Code;
	public String alpha3Code;
	public List<String> callingCodes;
	public String capital;
	public List<String> altSpellings;
	public String region;
	public String subregion;
	public Integer population;
	public List<Integer> latlng;
	public String demonym;
	public Integer area;
	public Double gini;
	public List<String> timezones;
	public List<String> borders;
	public String nativeName;
	public String numericCode;
	public List<Currencies> currencies;
	public List<Languages> languages;
	public Translations translations;
	public String flag;
	public List<RegionalBlocs> regionalBlocs;
	public String cioc;

	
	public static List<CountryLayerAPIWrapper> parse(String json) {
		return (List<CountryLayerAPIWrapper>) System.JSON.deserialize(json, List<CountryLayerAPIWrapper>.class);
	}
}