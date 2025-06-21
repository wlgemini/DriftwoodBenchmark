import AppKit
import Driftwood
import SnapKit
import Testing


@Test
@MainActor
func driftwood_make() {
    var duration = Duration.zero
    
    for _ in 0 ... 100_000 {
        let superview = NSView(frame: NSRect(x: 0, y: 0, width: 320, height: 480))
        let view1 = NSView(frame: .zero)
        let view2 = NSView(frame: .zero)
        superview.addSubview(view1)
        superview.addSubview(view2)
        
        let old = ContinuousClock.now
        
        view1.dw.make()
            .left(10)
            .top(20)
            .width(30)
            .height(40)
        
        view2.dw.make()
            .left(50, to: view1.dw.left)
            .top(60, to: view1.dw.bottom)
            .width(70, to: view1.dw.width)
            .height(80)
        
        duration += (ContinuousClock.now - old)
    }
    
    print("Driftwood make: ", duration)
}


@Test
@MainActor
func snapkit_make() {
    var duration = Duration.zero
    
    for _ in 0 ... 100_000 {
        let superview = NSView(frame: NSRect(x: 0, y: 0, width: 320, height: 480))
        let view1 = NSView(frame: .zero)
        let view2 = NSView(frame: .zero)
        superview.addSubview(view1)
        superview.addSubview(view2)
        
        let old = ContinuousClock.now
        
        view1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(30)
            make.width.equalTo(30)
            make.height.equalTo(40)
        }
        
        view2.snp.makeConstraints { make in
            make.left.equalTo(view1.snp.left).offset(50)
            make.top.equalTo(view1.snp.bottom).offset(60)
            make.width.equalTo(view1.snp.width).offset(70)
            make.height.equalTo(80)
        }
        
        duration += (ContinuousClock.now - old)
    }
    
    print("Snap make: ", duration)
}



@Test
@MainActor
func driftwood_remake() {
    let superview = NSView(frame: NSRect(x: 0, y: 0, width: 320, height: 480))
    let view1 = NSView(frame: .zero)
    let view2 = NSView(frame: .zero)
    superview.addSubview(view1)
    superview.addSubview(view2)
    
    let old = ContinuousClock.now
    
    for _ in 0 ... 100_000 {
        view1.dw.remake()
            .left(10)
            .top(20)
            .width(30)
            .height(40)
        
        view2.dw.remake()
            .left(50, to: view1.dw.left)
            .top(60, to: view1.dw.bottom)
            .width(70, to: view1.dw.width)
            .height(80)
    }
    
    print("Driftwood remake: ", ContinuousClock.now - old)
}


@Test
@MainActor
func snapkit_remake() {
    let superview = NSView(frame: NSRect(x: 0, y: 0, width: 320, height: 480))
    let view1 = NSView(frame: .zero)
    let view2 = NSView(frame: .zero)
    superview.addSubview(view1)
    superview.addSubview(view2)
    
    
    let old = ContinuousClock.now
    
    for _ in 0 ... 100_000 {
        view1.snp.remakeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(30)
            make.width.equalTo(30)
            make.height.equalTo(40)
        }
        
        view2.snp.remakeConstraints { make in
            make.left.equalTo(view1.snp.left).offset(50)
            make.top.equalTo(view1.snp.bottom).offset(60)
            make.width.equalTo(view1.snp.width).offset(70)
            make.height.equalTo(80)
        }
    }
    
    print("Snap remake: ", ContinuousClock.now - old)
}
