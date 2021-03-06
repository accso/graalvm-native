import java.io.*;
import java.nio.file.*;
import java.nio.file.attribute.*;
import static java.nio.file.FileVisitResult.*;
import static java.nio.file.FileVisitOption.*;
import java.util.*;

public class FileFinder {
    public static void main(String[] args) throws IOException { 
        if (args.length < 3 || !args[1].equals("-name")) {
		    System.err.println("java FileFinder <path> -name \"<glob_pattern>\"");
			System.exit(1);
        }
 
        Path startingDir = Paths.get(args[0]);
        String pattern = args[2];
 
        Finder finder = new Finder(pattern);
        Files.walkFileTree(startingDir, finder);
		System.out.println("Matched: " + finder.numMatches);
    }
}

class Finder extends SimpleFileVisitor<Path> {

	private final PathMatcher matcher;
	int numMatches = 0;

	Finder(String pattern) {
		matcher = FileSystems.getDefault().getPathMatcher("glob:" + pattern);
	}

	void find(Path file) {
		Path name = file.getFileName();
		if (name != null && matcher.matches(name)) {
			numMatches++;
			System.out.println(file.getFileName() + ": " + file.toFile().length());
		}
	}

	@Override
	public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) {
		find(file);
		return CONTINUE;
	}

	@Override
	public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) {
		find(dir);
		return CONTINUE;
	}

	@Override
	public FileVisitResult visitFileFailed(Path file, IOException exc) {
		System.err.println(exc);
		return CONTINUE;
	}
}
