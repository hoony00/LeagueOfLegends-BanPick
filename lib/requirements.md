### 주요 원칙

- 정확하고 간결한 Dart 코드를 예제와 함께 제공합니다.
- 함수형 및 선언적 프로그래밍 패턴을 적절하게 활용합니다.
- 상속보다는 구성을 선호합니다.
- 변수명에 설명이 잘 되도록 보조 동사(예: isLoading, hasError)를 사용합니다.
- 파일 구조: export된 위젯, 하위 위젯, 헬퍼 함수, 정적 콘텐츠, 타입 순으로 구성합니다.

### Dart/Flutter

- 불변 위젯에는 const 생성자를 사용합니다.
- 주요 클래스 및 불변 객체에는 freezed 패키지를 사용하여 불변성을 유지합니다. (이건 선택)
- 간단한 함수와 메서드는 화살표 구문을 사용합니다.
- 간단한 getter와 setter는 표현식 본문으로 작성합니다.
- 가독성을 위해 후행 쉼표를 사용합니다.

### 오류 처리 및 검증

- Snackbar 대신 SelectableText.rich를 사용해 오류 메시지를 표시합니다.
- 오류는 SelectableText.rich로 빨간색 텍스트로 표시하여 가시성을 높입니다.
- 화면 내에서 빈 상태를 처리합니다.
- AsyncValue를 사용해 오류와 로딩 상태를 적절히 관리합니다.

### Riverpod 사용

- 프로바이더를 생성할 때는 @riverpod 주석을 사용합니다.
- Provider보다 AsyncNotifierProvider와 NotifierProvider를 선호합니다.
- SingleTon 혹은 상태변화가 필요 없다면 Provider 사용합니다.
- StateNotifierProvider, ChangeNotifierProvider는 피합니다.
- 프로바이더 업데이트가 필요할 때는 ref.invalidate()를 사용합니다.
- 비동기 작업 시 적절한 위치에서 작업을 취소합니다.
- 간단한 상태는 StateProvider를 사용합니다.

### 성능 최적화

- 재구성을 최적화하기 위해 가능한 경우 재구성 전용 위젯을 사용합니다.
- ListView.builder로 리스트 뷰 최적화를 구현합니다.
- 정적 이미지는 AssetImage를, 원격 이미지는 cached_network_image를 사용합니다.

### 주요 규약

1. 탐색과 딥 링크는 GoRouter 패키지를 사용합니다.
2. Flutter 성능 지표 (첫 번째 의미 있는 페인트, 상호작용 시간 등)에 맞게 최적화합니다.
3. 무상태 위젯을 선호합니다:
    - 상태에 따라 변경되는 위젯이고 상태관리가 필요하다면 , Riverpod의 ConsumerWidget을 사용합니다.

### UI 및 스타일링

- Flutter의 기본 제공 위젯을 사용하여 커스텀 위젯을 만듭니다.
- LayoutBuilder 또는 MediaQuery를 사용해 반응형 디자인을 구현합니다.
- ScreenUtill 패키지를 우선으로 사용합니다.
- 앱 전체에서 일관된 스타일링을 위해 테마를 설정하고 활용합니다.
- headline6 대신 Theme.of(context).textTheme.titleLarge를 사용하고, headline5 대신 headlineSmall을 사용합니다.

### 모델 및 데이터베이스 규약

- 데이터베이스 테이블에는 createdAt, updatedAt, isDeleted 필드를 포함합니다.
- 모델에는 @JsonSerializable(fieldRename: FieldRename.snake)를 사용합니다.
- 읽기 전용 필드에는 @JsonKey(includeFromJson: true, includeToJson: false)를 사용합니다.

### 위젯 및 UI 구성 요소

- _build... 같은 메서드 대신 작은 개별 위젯 클래스를 만듭니다.
- RefreshIndicator를 사용해 당겨서 새로 고침 기능을 구현합니다.
- TextField에 적절한 텍스트 대문자화, 키보드 타입, 텍스트 입력 액션을 설정합니다.
- Image.network를 사용할 때는 항상 오류 작성자를 포함해야 합니다.

### 기타

- 디버깅 시 print 대신 log를 사용합니다.
- 가능하면 debugPrint 사용합니다. 


/// 
