/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* This class is a test class for CountryLayerAPIWrapper
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Phalguni Pendyala
* @modifiedBy     
* @maintainedBy   
* @version        1.0
**/
@IsTest
public class CountryLayerAPIWrapper_Test {
	
	static testMethod void testParse() {
		String json = '['+
		'    {'+
		'        \"name\": \"Afghanistan\",'+
		'        \"topLevelDomain\": ['+
		'            \".af\"'+
		'        ],'+
		'        \"alpha2Code\": \"AF\",'+
		'        \"alpha3Code\": \"AFG\",'+
		'        \"callingCodes\": ['+
		'            \"93\"'+
		'        ],'+
		'        \"capital\": \"Kabul\",'+
		'        \"altSpellings\": ['+
		'            \"AF\",'+
		'            \"Afġānistān\"'+
		'        ],'+
		'        \"region\": \"Asia\",'+
		'        \"subregion\": \"Southern Asia\",'+
		'        \"population\": 27657145,'+
		'        \"latlng\": ['+
		'            33,'+
		'            65'+
		'        ],'+
		'        \"demonym\": \"Afghan\",'+
		'        \"area\": 652230,'+
		'        \"gini\": 27.8,'+
		'        \"timezones\": ['+
		'            \"UTC+04:30\"'+
		'        ],'+
		'        \"borders\": ['+
		'            \"IRN\",'+
		'            \"PAK\",'+
		'            \"TKM\",'+
		'            \"UZB\",'+
		'            \"TJK\",'+
		'            \"CHN\"'+
		'        ],'+
		'        \"nativeName\": \"افغانستان\",'+
		'        \"numericCode\": \"004\",'+
		'        \"currencies\": ['+
		'            {'+
		'                \"code\": \"AFN\",'+
		'                \"name\": \"Afghan afghani\",'+
		'                \"symbol\": \"؋\"'+
		'            }'+
		'        ],'+
		'        \"languages\": ['+
		'            {'+
		'                \"iso639_1\": \"ps\",'+
		'                \"iso639_2\": \"pus\",'+
		'                \"name\": \"Pashto\",'+
		'                \"nativeName\": \"پښتو\"'+
		'            },'+
		'            {'+
		'                \"iso639_1\": \"uz\",'+
		'                \"iso639_2\": \"uzb\",'+
		'                \"name\": \"Uzbek\",'+
		'                \"nativeName\": \"Oʻzbek\"'+
		'            },'+
		'            {'+
		'                \"iso639_1\": \"tk\",'+
		'                \"iso639_2\": \"tuk\",'+
		'                \"name\": \"Turkmen\",'+
		'                \"nativeName\": \"Türkmen\"'+
		'            }'+
		'        ],'+
		'        \"translations\": {'+
		'            \"br\": \"Afeganistão\",'+
		'            \"de\": \"Afghanistan\",'+
		'            \"es\": \"Afganistán\",'+
		'            \"fa\": \"افغانستان\",'+
		'            \"fr\": \"Afghanistan\",'+
		'            \"hr\": \"Afganistan\",'+
		'            \"it\": \"Afghanistan\",'+
		'            \"ja\": \"アフガニスタン\",'+
		'            \"nl\": \"Afghanistan\",'+
		'            \"pt\": \"Afeganistão\"'+
		'        },'+
		'        \"flag\": \"https://restcountries.eu/data/afg.svg\",'+
		'        \"regionalBlocs\": ['+
		'            {'+
		'                \"acronym\": \"SAARC\",'+
		'                \"name\": \"South Asian Association for Regional Cooperation\"'+
		'            }'+
		'        ],'+
		'        \"cioc\": \"AFG\"'+
		'    }'+
		']';
		List<CountryLayerAPIWrapper> obj = CountryLayerAPIWrapper.parse(json);
		System.assert(obj != null);
	}
}