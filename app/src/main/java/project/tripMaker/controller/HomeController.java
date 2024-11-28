package project.tripMaker.controller;

import java.util.stream.IntStream;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class HomeController {

  @Value("${spring.web.resources.static-locations}")
  private String resourceLocation;

  private static final String DEFAULT_IMAGE =
      "https://dgg7dnk35523.edge.naverncp.com/HZiW9aEJy7/review/default.png?type=u&w=550&h=480";

  @Value("${s3.bucket.url}")
  private String s3BucketUrl;
  private static final String IMAGE_PATH = "/review/";
  private static final String IMAGE_PARAMS = "?type=u&w=550&h=480";


  @GetMapping("/home")
  public String home(Model model) {
    model.addAttribute("welcome", "<b>안녕</b>하세요!");

    // try {
    //   // resourceLocation에서 이미 file: 포함되어 있으므로 static은 제거
    //   String resourcePath = resourceLocation.replace("file:", "").replace("classpath:", "");
    //   Path bannerPath = Paths.get(resourcePath, "images", "banner");
    //
    //   // 디버깅용 로그
    //   System.out.println("Resource Location: " + resourceLocation);
    //   System.out.println("Banner Path: " + bannerPath);
    //   System.out.println("Directory exists: " + Files.exists(bannerPath));
    //
    //   if (Files.exists(bannerPath)) {
    //     List<String> imageFiles = Files.list(bannerPath)
    //         .filter(file -> {
    //           String fileName = file.getFileName().toString().toLowerCase();
    //           return fileName.endsWith(".jpg") || fileName.endsWith(".jpeg")
    //               || fileName.endsWith(".png") || fileName.endsWith(".gif");
    //         })
    //         .sorted()
    //         .map(path -> {
    //           System.out.println("Found image: " + path.getFileName());
    //           return "/images/banner/" + path.getFileName().toString();
    //         })
    //         .collect(Collectors.toList());
    //
    //     System.out.println("Total images found: " + imageFiles.size());
    //     model.addAttribute("bannerImages", imageFiles);
    //   }
    //
    // } catch (IOException e) {
    //   System.out.println("Error reading banner directory: " + e.getMessage());
    //   e.printStackTrace();
    // }

    model.addAttribute("welcome", "<b>안녕</b>하세요!");

    // S3 URL 생성 로직
    List<String> bannerImages = IntStream.range(1, 7) // default1부터 default6까지 이미지 생성
        .mapToObj(i -> s3BucketUrl + IMAGE_PATH + "default" + i + ".jpg" + IMAGE_PARAMS)
        .collect(Collectors.toList());

    // 디버깅용 로그
    bannerImages.forEach(url -> System.out.println("Generated S3 Image URL: " + url));

    model.addAttribute("bannerImages", bannerImages);

    return "home";
  }
}
