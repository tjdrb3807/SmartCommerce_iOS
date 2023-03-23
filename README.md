# SmartCommerce_iOS


## Architecture

### MVVM

<br>

## Code Style

* ### 디렉토리 구성
  * 화면 폴더(`Scenes`), 데이터 폴더(`Entities`), 네트워크 폴더(`Network`)를 구분한다.
  * 화면 폴더 내에는 `ViewController` 폴더, `SubComponents` 폴더를 갖는다.
    * ViewController 폴더 내에는 ViewController, ViewModel, View 파일을 갖느다.
    * SubComponents 폴더 내에는 Cell 파일은 갖느다.
  * 데이터 폴더 내에는 View에서 사용할 Data 파일과 JSON Data를 Decoding할 DTO 파일을 간는다.
  * 네트워크 폴더 내에는 API정의 파일과 Network 설정 파일을 갖는다.

<br>

* ### 코드로 Layout을 구현할 때 여러개의 SubView 추가 방법   
    ```Swift
    [subView01, subView02, subView03].forEach { superView.addSubView($0) }
    ```     

<br>

* ### SnapKit
  * 제약조건 잡는 순서: `top`, `leading`, `trailing`, `bottom`, `width`, `height` 순서
  * makeConstraints 클로저에 `make` vs `$0` => `$0`로 통일

<br>

* ### layout function
  * 뷰의 AutoLayout을 담당하는 함수는 별도의 layout함수를 선언에서 정의한다.
  * layout 함수 안에는 addSubView, SnapKit을 정의한다.
  * 다른 곳에서 해당 View의 layout을 설정할 수 없도록 private으로 설정한다.

<br>

* ### 뷰를 선언할 때 lazy var vs let
  * 큰 차이는 없지만 뷰가 보여지는 시점에 인스턴스를 호출하여 조금이나마 메모리 낭비를 방지하기위해 `lazy var` 채택.

<br>

* ### 뷰 선언과 동시에 초기화(클로저 사용)
  * 별도의 함수를 만들어서 각가의 뷰마다 속성을 정의하면 개인적으로 코드가 지저분해보인다.
  * 뷰가 선언된 부분에서 속성도 같이 처리해서 해당 뷰가 어떤 속성을 갖는지 가독성을 높히도록 한다.
    ```Swift
    private lazy var shoopingBasketButton: UIButton = {
        let button = UIButton()
        let imageConfig = UIimage.SymbolConfigureation(pointSize: 25.0, weight: .thin)
        let image = UIImage(systemName: "bag", withConfiguration: imageConfig)

        button.setImate(image, for: .normal)
        button.tintColor = .black

        return button
    }()
    ```

<br>

* ### ViewModel에서 Observable Event가 전달되는 방향을 주석이로 표기한다.
  * View -> ViewModel
  * ViewModel -> View
  * Parent ViewModel -> ViewModel

<br>
<br>
<br>

## API


* ### GET vs POST
  * 해당 프로젝트에서는 Requet Body에 DTO를 넣는 로직은 없지만, GET을 사용할때 요청 정보를 Query Parameter로 넘기게 되면 보안에 취약할 수 있으므로 `POST` 방식을 채택한다.(개인적인 견해)

<br>

 * ### 배너 API
   * API 설명
     * HomeView/RecommendView 에 위치한 배너 가각의 이미지와 텍스트 정보를 가져온다
   * URL: http/localhost:8080/commerce/api/v1/home/eventBanner
   * HTTP Method: POST    
   * Response DTO
        ```JSON
        {
            "event_banner_id": 1,
            "event_content": "ON & OFF",
            "thumbnail_image_url": "https://image.msscdn.net/images/plan_w_mobile_img/2023030213534100000045627.jpg"
        }
        ``` 

<br>

* ### 이벤트 카테고리 API
  * API 설명
    * HomeView/RecommedView, CategoryView 상단에 UICollectionView Cell에 이미지와 타이들 정보를 가져오는 API
    * thumbnail_image_url은 Home/RecommendView CollectionView에 사용
    * thumbnail_text_image_url은 CategoryView CollectionView에 사용
  * URL: http/localhost:8080/commerce/api/v1/category/event
  * HTTP Method: POST
  * Response DTO
    ```JSON   
    { 
        "event_title": "럭셔리",
        "thumbnail_image_url": "https://image.msscdn.net/mfile_s01/_lookbook/list63f2d10b7f7ec",
        "thumbnail_text_image_url": "https://image.msscdn.net/images/event_banner/2022091316493400000037242.png"
    }
      ``` 

<br>

* ### 카테고리 API
  * API 설명
    * CategoryView 죄측 TableView에 나열할 카테고리 PK와 텍스트 정보를 가져온다.
  * URL: http:/localhost:8080/commerce/api/v1/category
  * HTTP Method: POST
  * Response DTO
    ```JSON
    {
        "category_id": 1,
        "category_title": "상의"
    }
    ``` 

<br>

* ### 아이템 API
  * API 설명
    * CategoryView 우측 CollectionView에 나열한 아이템 PK와 카테고리 FK, 이미지, 텍스트 정보를 가져온다.
  * URL: http:/localhost:8080/commerce/api/v1/itemType
  * HTTP Method: POST
  * Response DTO
    ```JSON
    {
        "id": 1,
        "category_id": 1,
        "item_type_title": "상의 신상",
        "item_type_thumbnail_image_url": "https://image.msscdn.net/images/goods_img/20220810/2710588/2710588_1_220.jpg"
    }
    ``` 

<br>
<br>
<br>


## Code Review
* 


 
